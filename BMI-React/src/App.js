import './App.css';
import React, { useState } from 'react'
function App() {

  const [weight, setWeight] = useState('');
  const [height, setHeight] = useState('');
  const [bmi, setBMI] = useState('');
  const [message, setMessage] = useState('');


  let calcBMI = (e) => {

    e.preventDefault();


    if (weight === 0 || height === 0) {
      alert('Insira um valor válido de altura e largura')
    }




    else {
      let bmi = (weight / (height * height) * 10000)
      setBMI(bmi.toFixed(1));
      if (bmi < 18.5) {
        setMessage('Você vai morrer assim muito magro')
      }
      else if (bmi > 25) {
        setMessage('Aí sim Fit');
      }
      else if (bmi <= 25 && bmi < 30) {
        setMessage('Projetinho Felas')
      }
      else if (bmi >= 30) {
        setMessage('Em pleno século 20, ano da copa, você conhece o elon musk')
      }
      else {
        setMessage('Vai morrer maluco');
      }
    }
  }


  let reload = () => {
    window.location.reload();
  }

  return (

    <div id="container">
      <div id='calculator'>
        <h2>Calculate</h2>
        <form onSubmit={calcBMI}>
          <input id="weight" type="text" placeholder='Coloque sua Massa aqui' value={weight} onChange={(e) => setWeight(e.target.value)} />
          <input id="height" type="text" placeholder='Coloque sua Altura aqui' value={height} onChange={(e) => setHeight(e.target.value)} />
          <button id='calculate' className='btn' type='submit'>Enviar</button>
          <button id='calculate'className='btn btn-outline' onClick={reload} type="submit">Reload</button>
          <div id="yourBMI">Your BMI Is : <span>{bmi}</span></div>
        </form>
      </div>


      <div id='guide'>
        <h2>GUIDE</h2>
        <ul>
          <li>{message}</li>

        </ul>
      </div>
    </div>
  );
}

export default App;
