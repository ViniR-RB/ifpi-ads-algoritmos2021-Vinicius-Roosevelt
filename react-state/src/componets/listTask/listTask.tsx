import Task from "../../model/task_entity"
import { ItemTask } from "../itemTask/itemTask"
import { ListaHeader } from "./style"

interface ListTaskProps {
    tasks: Task[]
    onChangeTask: any
    onDeleteTask: (taskId: number) => void
}


export function ListTask({ tasks, onChangeTask, onDeleteTask }: ListTaskProps) {




    return (
        <ListaHeader>
            {tasks.map(task => (
                <ItemTask task={task} onChangeTask={onChangeTask} onDeleteTask={onDeleteTask} />
            ))}
        </ListaHeader>
    )
}