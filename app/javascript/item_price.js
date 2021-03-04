window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    /* ¸手数料入力 */
   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
   const addTax = Math.floor(inputValue * 0.1);

   const profit = document.getElementById("profit");
   profit.innerHTML = inputValue - addTax;
  })
});