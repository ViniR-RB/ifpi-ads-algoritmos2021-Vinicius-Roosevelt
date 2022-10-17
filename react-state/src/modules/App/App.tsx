import { useState } from 'react';
import { FormAddTask } from '../../componets/formAddTask/formAddTask';
import { ListTask } from '../../componets/listTask/listTask';
import Task from '../../model/task_entity';
import GlobalStyle from '../../styles/global';

import { Body, Header } from './style';

function App() : JSX.Element {
  const [tasks, setTasks] = useState<Task[]>(initialTasks)



  function handleAddTask(text: string){
    setTasks([
      ...tasks,
      {
        id: nextId++,
        text: text,
        done: false,
      }
    ]);
    console.log(tasks);
  }

  function handleChangeTask(task: Task){
    setTasks(
      tasks.map((t) => {
        if(t.id == task.id){
          return task
        }else {
          return t
        }
      })
    )
  }
  function handlerDeleteTask(taskId:number){
    setTasks(tasks.filter((t) => t.id !== taskId))
  }

  return (
    <>
      <Header>
        <h1>React + Reducer</h1>
        <h3>Tasks</h3>
      </Header>
      <Body>
      <FormAddTask onAddTask={handleAddTask}/>
      <ListTask tasks={tasks} onChangeTask={handleChangeTask} onDeleteTask={handlerDeleteTask}/>
      </Body>
      <GlobalStyle />
    </>





  )

}
let nextId = 3
const initialTasks: Task[] = [
  {id: 0, text: 'Elaborar Aulas', done: true},
  {id: 1, text: 'Estudar Flutter - Estados', done: false},
  {id: 2, text: 'Correr avenida Raul Lopres', done: false},
];

export default App