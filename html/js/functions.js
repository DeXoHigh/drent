function main_menu(vehicles){
  $(".ui").fadeIn();
  $(".vehicles").html("");
  $.each(vehicles, function(index, vehicle) {
    $(".vehicles").append(`
    <div class="vehicle" id="vehicle-${vehicle.model}">
      <div class="header">
          <div class="header-title">${vehicle.label}</div>
          <div class="header-description">${vehicle.description}</div>
      </div>
      <div class="image">
          <img src="assets/${vehicle.image}.png" alt="teste">
      </div>
      <div class="footer">
          <div class="footer-type">${vehicle.type}</div>
          <div class="footer-price">${vehicle.price}$</div>
      </div>
    </div>
    `);

    $(`#vehicle-${vehicle.model}`).click(function () {
      $.post('https://dexo_rent/rent', JSON.stringify({
          model: vehicle.model,
          price: vehicle.price,
          location: vehicle.location
      }));
      closeMenu()
    })

  })

}

function closeMenu() {
  $.post("https://dexo_rent/CloseUI", JSON.stringify({}));
}