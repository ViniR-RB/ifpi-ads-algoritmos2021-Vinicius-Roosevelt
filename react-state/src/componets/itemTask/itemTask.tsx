import { ChangeEvent, useCallback, useEffect, useMemo, useRef, useState } from "react"
import Task from "../../model/task_entity"
import { Lista } from "./styles"

interface TaskItemProps {
    task: Task
    onChangeTask: any
    onDeleteTask: (taskId: number) => void
}

export function ItemTask({ task, onChangeTask, onDeleteTask }: TaskItemProps) {
    const [taskText, setTaskText] = useState(task.text)
    const [isEditing, setIsEditing] = useState(false)
    const inputTaskTextRef = useRef<HTMLInputElement>(null)
    const handlerDoneChange = useCallback(() => {
        () => {
            task.done = !task.done
        }
    }, [task])
    const handlerTextChange = (event: ChangeEvent<HTMLInputElement>) => {
        setTaskText(event.target.value)
    }
    const handlerEditSaveClick = () => {
        if (isEditing) {
            onChangeTask({ ...task, text: taskText })
        } else {
            setIsEditing(true);
        }
    }
    useEffect(() => {
        isEditing && inputTaskTextRef.current!.focus()
    }, [isEditing])
    const buttonLabel = useMemo(() => isEditing ? 'Salvar' : 'Editar', [isEditing])
    return (

        <Lista key={task.id}>
            <input type='checkbox' checked={task.done} onChange={handlerDoneChange} />
            {
                isEditing ? (

                    <input ref={inputTaskTextRef}
                        value={taskText}
                        onChange={handlerTextChange} />
                )
                    : (
                        <span>{task.text}</span>
                    )
            }
            <button onClick={handlerEditSaveClick}>{buttonLabel}</button>
            <button onClick={() => onDeleteTask(task.id)} >Apagar</button>

        </Lista>

    )
}