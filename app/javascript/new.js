function culculate() {
  const price = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener('input', function(){
    if(isNaN(price.value)){
      fee.textContent = "isNaN"
      profit.textContent = "isNaN"
    } else {
      const feeValue = Math.floor(price.value * 0.1)
      const profitValue = price.value - feeValue
      fee.textContent = Math.floor(feeValue)
      profit.textContent = Math.floor(profitValue)
    }
  })
}
window.addEventListener('turbo:load', culculate)
window.addEventListener("turbo:render",culculate);
