<script>

 let weight = 0
 let height = 0
  let bmiValue = 0


function calculate(weight,height){
   if(height != "" && weight != ""){
        let bmiValue = weight / (height * height) * 10000  ;
        yourBMI.innerHTML = `Your BMI Is : <span> ${bmiValue.toFixed(2)} </span>`
     
    }else{
      alert('Insira valores válidos')
    }
};



</script>



<body>
<div id="container">
        <div id="calculator">
            <h2>CALCULATE</h2>
            <input bind:value={weight} type="text" name="bmi" id="weight" placeholder="Weight In KG">
            <input bind:value={height} type="text" name="bmi" id="height" placeholder="Height In CM">
            <input on:click={calculate(weight,height)} type="submit" value="Calculate" id="calculate">
            <div id="yourBMI">Your BMI Is : <span>{bmiValue}</span></div>
        </div>
        <div id="guide">
            <h2>GUIDE</h2>
            <ul>
                <li>Under Weight = Less Then 18.5 BMI</li>
                <li>Normal Weight = 18.5 To 24.9 BMI</li>
                <li>Over Weight = 25 To 29.9 BMI</li>
                <li>Obesity = 30 Or Greater BMI</li>
            </ul>
        </div>
    </div>
</body>







<style>
    * {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Exo', sans-serif;
}



#container {
    height: 400px;
    width: 700px;
    background: #fff;
    display: flex;
    flex-direction: row;
    border-radius: 40px 0;
    overflow: hidden;
    box-shadow: 2px 2px 4px #00000010, -2px -2px 4px #00000010;
}

#calculator,
#guide {
    height: 400px;
    width: 350px;
    padding: 20px;
}

#guide {
    background: #1479ff;
}

#calculator h2,
#guide h2 {
    text-align: center;
    font-size: 30px;
    margin: 20px 0;
    color: #1479ff;
}

#guide h2 {
    color: #000;
    letter-spacing: 2px;
    font-size: 50px;
}

#calculator input[type="text"] {
    height: 45px;
    width: 310px;
    margin: 10px 0;
    padding: 0px 15px;
    border: 2px solid #1479ff;
    outline: none;
    background: #f3f8ff;
    color: #1479ff;
    font-size: 15px;
    font-weight: 800;
}

#calculator input[type="text"]::placeholder {
    color: #1479ff;
}

#calculator input[type="submit"] {
    height: 50px;
    width: 310px;
    margin: 20px 0;
    padding: 0px 15px;
    border: none;
    outline: none;
    background: #1479ff;
    color: #fff;
    font-size: 15px;
    font-weight: 800;
    cursor: pointer;
}

#calculator #yourBMI {
    font-size: 20px;
    color: #1479ff;
    font-weight: 800;
}

#guide ul {
    padding: 0 20px;
}

#guide ul li {
    height: 50px;
    font-size: 16px;
}


    </style>

