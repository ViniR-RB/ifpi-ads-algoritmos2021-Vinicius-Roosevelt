import { ChangeEvent, FormEvent, useState } from "react";
import { Form } from "./style";

interface AddTaskProps{
    onAddTask: (text: string ) => void
} 


export function FormAddTask({onAddTask}: AddTaskProps){
    const [taskText,setTaskText] = useState('')
    const handlerDescriptionChange = (event: ChangeEvent<HTMLInputElement>) => {
        setTaskText(event.target.value)
    }
    const handlerSubmit = (event: FormEvent) => {
        event.preventDefault()
        onAddTask(taskText)
        setTaskText('')
    }

    return(
        <Form onSubmit={handlerSubmit}>
        <input type='text' onChange={handlerDescriptionChange} value={taskText}  placeholder='Descrição' />
        <input type='submit' value='Adicionar Tarefa'/>
      </Form>
    )
}