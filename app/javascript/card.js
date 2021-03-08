const pay = () => {
  Payjp.setPublicKey("pk_test_273141074e0f69310fc066c5"); 
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
  
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("pay_form[number]"),
      cvc: formData.get("pay_form[cvc]"),
      exp_month: formData.get("pay_form[exp_month]"),
      exp_year: `20${formData.get("pay_form[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("pay_form[number]");
      document.getElementById("card-cvc").removeAttribute("pay_form[cvc]");
      document.getElementById("card-exp-month").removeAttribute("pay_form[exp_month]");
      document.getElementById("card-exp-year").removeAttribute("pay_form[exp_year]");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);