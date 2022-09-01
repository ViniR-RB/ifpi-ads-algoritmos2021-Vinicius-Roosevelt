const express = require('express')
const authMiddleware= require('../middlewares/auth')
const router = express.Router()
const Project = require('../models/project')
const Task = require('../models/task')
router.use(authMiddleware)




router.get('/' ,async(req,res) => {
    try{
        const projects = await Project.find().populate(['user', 'tasks']);

        return res.send({projects});
    }   catch(err){
        return res.status(400).send({msg: "Erro em carregar os projetos"})
    }
});

router.get('/:projectId', async(req,res) =>{
    try{
        const project = await Project.findById(req.params.projectId).populate(['user', 'tasks']);

        return res.send({project});
    }   catch(err){
        return res.status(400).send({msg: "Erro em carregar os projeto"})
    }
});




router.post('/', async (req,res) => { 
    try{
        const { title, descripition, tasks}  = req.body

        const project = await Project.create({ title,descripition, user: req.userId });

        await Promise.all (tasks.map(async task => {
            const projectTask = new Task({...task,project: project._id});
            // Meneira de Criar Task em um Banco NoSQL
             await projectTask.save()
             project.tasks.push(projectTask)

             
        }))
        await project.save()
        return res.send({project});
    }catch(err){
        res.status(400).send({msg: 'Error em Criar novo Projeto'})
    }

});



router.put('/:projectId', async(req,res) =>{
    try{
        const { title, descripition, tasks}  = req.body

        const project = await Project.findByIdAndUpdate(req.params.projectId,
            { title,descripition, user: req.userId }, {new: true});


        project.tasks = [];
        await Task.remove({project: project._id});

        await Promise.all (tasks.map(async task => {
            const projectTask = new Task({...task,project: project._id});
            // Meneira de Criar Task em um Banco NoSQL
             await projectTask.save()
             project.tasks.push(projectTask)

             
        }))
        await project.save()
        return res.send({project});
    }catch(err){
        res.status(400).send({msg: 'Error em dar Update novo Projeto'})
    }
});



router.delete('/:projectId', async(req,res) =>{
    try{
        const project = await Project.findByIdAndRemove(req.params.projectId)

        return res.send();
    }   catch(err){
        return res.status(400).send({msg: "Erro em deletar os projeto"})
    }
});



module.exports = app => app.use('/projects', router);