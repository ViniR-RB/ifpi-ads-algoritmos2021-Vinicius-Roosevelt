<script>
    export let weight = 0

</script>
export   <div id="calculator">
            <h2>CALCULATE</h2>
            <input bind:value={weight} type="text" name="bmi" id="weight" placeholder="Weight In KG">
            <input bind:value={height} type="text" name="bmi" id="height" placeholder="Height In CM">
            <input on:click={calculate(weight,height)} type="submit" value="Calculate" id="calculate">
            <div id="yourBMI">Your BMI Is : <span>{bmiValue}</span></div>
        </div>

<style>
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Exo', sans-serif;
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

</style>