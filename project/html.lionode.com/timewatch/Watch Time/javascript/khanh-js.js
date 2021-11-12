
// search at top

function searchPopular() {
    $(".input-text-search-top").click(() => {
        $(".contain-search-popular").css("display", "flex");
    });
    $(".contain-search").mouseleave(() => {
        $(".contain-search-popular").css("display", "none");
    });
}

$(window).ready(searchPopular, dropdownLocate);

// filter search {
function toggleFilterSearch() {
    $(".toggle-filter-search").click(() => {
        $(".contain-filter-search").slideToggle("show");
    });
}

$(window).ready(toggleFilterSearch);

// dropdown
function dropdownLocate() {
    $(".open-dropdown-locate").click(() => {
        $(".dropdown-locate").css("display", "inline");
        $(".open-dropdown-locate").css("display", "none");
        $(".close-dropdown-locate").css("display", "inline");
        $(".contain-dropdown-locate").css("height", "550px");
    });

    $(".close-dropdown-locate").click(() => {
        $(".dropdown-locate").css("display", "none");
        $(".open-dropdown-locate").css("display", "inline");
        $(".close-dropdown-locate").css("display", "none");
        $(".contain-dropdown-locate").css("height", "330px");
    });
}

$(window).ready(dropdownLocate);

// click price search
function clickPrice() {
    $("#price-search-01").click(() => {
        $("#price-search-01").css("background-color", "#5f2525");
    });
    $("#price-search-02").click(() => {
        $("#price-search-02").css("background-color", "#5f2525");
    });
    $("#price-search-03").click(() => {
        $("#price-search-03").css("background-color", "#5f2525");
    });
}

$(window).ready(clickPrice);

// navigation
function changeCategoryNav() {
    $("#category-football").mouseover(() => {
        setUpCategoryNav();
        $("#item-category-football").css("display", "flex");
        if ($(window).width() < 750)
            $(".nav-detail-info").css("top", "80px");
    });
    $("#category-gym").mouseover(() => {
        setUpCategoryNav();
        $("#item-category-gym").css("display", "flex");
        if ($(window).width() < 750)
            $(".nav-detail-info").css("top", "120px");
    });
    $("#category-running").mouseover(() => {
        setUpCategoryNav();
        $("#item-category-running").css("display", "flex");
        if ($(window).width() < 750)
            $(".nav-detail-info").css("top", "160px");
    });
    $("#category-brand").mouseover(() => {
        setUpCategoryNav();
        $("#item-category-brand").css("display", "flex");
        if ($(window).width() < 750)
            $(".nav-detail-info").css("top", "200px");
    });

    $(".nav-detail-info").mouseover(() => {
        $(".nav-detail-info").css("display", "grid");
    });

    $(".navbar-collapse").mouseout(() => {
        $(".nav-detail-info").css("display", "none");
    });
}

function setUpCategoryNav() {
    $(".nav-detail-info").css("display", "grid");
    $("#item-category-gym").css("display", "none");
    $("#item-category-football").css("display", "none")
    $("#item-category-running").css("display", "none");
    $("#item-category-brand").css("display", "none");
}

$(window).ready(changeCategoryNav);

// display product category
function Product(brand, nameProduct, linkSrc, price, saleRate, oldPrice) {
    this.brand = brand;
    this.nameProduct = nameProduct;
    this.linkSrc = linkSrc;
    this.price = price;
    this.saleRate = saleRate;
    this.oldPrice = oldPrice;
}

function displayCategory(position = 0) {
    $(".grid-list-wrapper").text(""); // reset after choose pagination
    let arrProduct = FirmGroundFootballMan;
    for (let i = position * 9; i < (position * 9) + 9; i++) {
        if (i == arrProduct.length - 1)
            break;
        let value = arrProduct[i];
        let contain = "<div class=\"product-layout product-grid col-lg-4 col-md-5 col-sm-6 col-xs-10\">\n" +
            "          <div class=\"product-thumb\">\n" +
            "            <div class=\"image product-imageblock\">\n" +
            "              <a href=\"product.html\">" +
            "                  <div class=\"related-product-sale\">\n" +
            "                     <h5 style='margin-top: 10px'>" + 10 % +"</h5>\n" +
            "                   </div>" +
            " <img src=\"" + value.img1 + "\" alt=\"lorem ippsum dolor dummy\" title=\"lorem ippsum dolor dummy\" class=\"img-responsive\" /> </a>\n" +
            "              <div class=\"button-group\">\n" +
            "                <button type=\"button\" class=\"wishlist\" data-toggle=\"tooltip\" title=\"Thêm vào yêu thích\"><i class=\"fas fa-heart\"></i></button>\n" +
            "                <button type=\"button\" class=\"addtocart-btn\">Mua ngay</button>\n" +
            "                <button type=\"button\" class=\"compare\" data-toggle=\"tooltip\" title=\"Thêm vào giỏ hàng\"><i class=\"fas fa-shopping-cart\"></i></button>\n" +
            "              </div>\n" +
            "            </div>\n" +
            "            <div class=\"caption product-detail\">\n" +
            "           <h2 style='margin-top: 5px; text-transform: uppercase'>" + value.brand + "</h2>" +
            "              <h4 class=\"product-name\"> " +
            "<a href=\"product.html\" title=\"lorem ippsum dolor dummy\" style='text-transform: capitalize'>" +
            value.name + " </a> </h4>\n" +
            "              <p class=\"product-desc\"> More room to move. With 80GB or 160GB of storage and up to 40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go. Cover\n" +
            "                Flow. Browse through your music collection by flipping..</p>\n" +
            "              <p class=\"price product-price\"><span class=\"price-old\" style='margin-right: 10px'>" + value.price + 0 + "</span>" + value.price + " <span class=\"price-tax\">Ex Tax: $100.00</span> </p>\n" +
            "              <div class=\"rating\"> <span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-2x\"></i><i class=\"fa fa-star-o fa-stack-2x\"></i></span> <span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-2x\"></i><i class=\"fa fa-star-o fa-stack-2x\"></i></span>                                    <span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-2x\"></i><i class=\"fa fa-star-o fa-stack-2x\"></i></span> <span class=\"fa fa-stack\"><i class=\"fa fa-star-o fa-stack-2x\"></i></span> <span class=\"fa fa-stack\"><i class=\"fa fa-star-o fa-stack-2x\"></i></span>                                    </div>\n" +
            "            </div>\n" +
            "            <div class=\"button-group\">\n" +
            "              <button type=\"button\" class=\"wishlist\" data-toggle=\"tooltip\" title=\"Thêm vào yêu thích\"><i class=\"fas fa-heart\"></i></button>\n" +
            "              <button type=\"button\" class=\"addtocart-btn\">Mua ngay</button>\n" +
            "              <button type=\"button\" class=\"compare\" data-toggle=\"tooltip\" title=\"Thêm vào giỏ hàng\"><i class=\"fas fa-shopping-cart\"></i></button>\n" +
            "            </div>\n" +
            "          </div>\n" +
            "        </div>";

        $(".grid-list-wrapper").append(contain);
    }

}

function displayPagination() {
    let num = Math.ceil(FirmGroundFootballMan.length / 9);
    let contain = "";
    for (let i = 1; i <= num; i++) {
        contain += `<li><a id="page-${i}">${i}</a></li>`;
    }
    $(".pagination").append(contain);
}

$(window).ready(displayPagination);

function getPositionPagination() {
    displayCategory(0); // init
    let arrPg = $(".pagination li a");
    let pos = 1;
    for (let i = 0; i < arrPg.length; i++) {
        arrPg[i].addEventListener("click", () => {
            pos = arrPg[i].text;
            displayCategory(+pos - 1);
        });
    }
}

$(window).ready(getPositionPagination);

function displaySizeInRefineSearch() {
    let sizeArr = [34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45]
    sizeArr.forEach((value) => {
        $(".contain-dropdown-size").append(
            " <label class=\"checkbox\">\n" +
            " <input name=\"filter[]\" type=\"checkbox\" value=\"1\" />\n" +
            value + "</label>"
        );
    });
}

$(window).ready(displaySizeInRefineSearch);

// access information of page costumer
function accessInfoCustomer() {
    $("#nav-info-customer").click(() => {
        resetAllSectionCustomer();
        $("#info-customer").css("display", "block");
    });
    $("#nav-bank-customer").click(() => {
        resetAllSectionCustomer();
        $("#bank-customer").css("display", "block");
    });
    $("#nav-map-customer").click(() => {
        resetAllSectionCustomer();
        $("#map-customer").css("display", "block");
    });
    $("#nav-password-customer").click(() => {
        resetAllSectionCustomer();
        $("#password-customer").css("display", "block");
    });
    $("#nav-cart-customer").click(() => {
        resetAllSectionCustomer();
        $("#cart-customer").css("display", "block");
    });
    $("#nav-history-customer").click(() => {
        resetAllSectionCustomer();
        $("#history-customer").css("display", "block");
    });

    $(".adjust-address-customer").click(() => {
        $(".contain-form-adjust-address").css("display", "block");
        $(".default-address").css("display", "none");
        $(".available-address").css("display", "none");
        $("#submit-adjust-address-customer").val("Chỉnh sửa");
    });

    $(".contain-add-map").click(() => {
        $(".contain-form-adjust-address").css("display", "block");
        $(".available-address").css("display", "none");
        $("#submit-adjust-address-customer").val("Thêm");
        $(".default-address").css("display", "none");
    });

    $("#submit-adjust-address-customer").click(() => {
        $(".contain-form-adjust-address").css("display", "none");
        $(".available-address").css("display", "block");
        $(".default-address").css("display", "block");
    });
    $("#delete-adjust-address-customer").click(() => {
        $(".contain-form-adjust-address").css("display", "none");
        $(".available-address").css("display", "block");
        $(".default-address").css("display", "block");
    });
}

function resetAllSectionCustomer() {
    $("#info-customer").css("display", "none");
    $("#bank-customer").css("display", "none");
    $("#map-customer").css("display", "none");
    $("#password-customer").css("display", "none");
    $("#cart-customer").css("display", "none");
    $("#history-customer").css("display", "none");
}
$(window).ready(resetAllSectionCustomer);

$(window).ready(accessInfoCustomer);

// load location customer
function loadLocation() {
    loadCity();
    loadDistrict(89,);
    loadWard(883);
}

function chooseLocation() {
    loadLocation();
    $('#contain-option-city').on('change', function () {
        let cityCode = $(this).val();
        loadDistrict(cityCode,);
        let codeFirstDistrict = "";
        for (let i = 0; i < districts.length; i++) {
            if (districts[i].parent_code == cityCode) {
                codeFirstDistrict = districts[i].code;
                break;
            }
        }
        loadWard(codeFirstDistrict);
    });

    $('#contain-option-district').on('change', function (e) {
        let districtCode = $(this).val();
        loadWard(districtCode);
    });
}

function loadCity() {
    let city = "";
    cities.forEach((element) => {
        city += "<option value=\"" + element.code + "\"" + "class=\"city\">" + element.name + "</option>\n";
    });
    $("#contain-option-city").append(city);
}

function loadDistrict(districtCode) {
    let districtArr = "";
    districtArr = districts.filter((value) => value.parent_code == districtCode);
    let district = "";
    districtArr.forEach((element) => {
        district += "<option value=\"" + element.code + "\"" + "class=\"district\">" + element.name + "</option>\n";
    });
    $("#contain-option-district").text("");
    $("#contain-option-district").append(district)
}

function loadWard(wardCode) {
    let wardArr = wards.filter((value) => value.parent_code == wardCode);
    let ward = "";
    wardArr.forEach((element) => {
        ward += "<option value=\"" + element.code + "\"" + "class=\"ward\">" + element.name + "</option>\n";
    });
    $("#contain-option-ward").text("");
    $("#contain-option-ward").append(ward);
}

$(window).ready(chooseLocation);
$(window).ready(chooseLocation);
$(window).ready(chooseLocation);

// display featured product

function displayFeaturedProduct() {
    let arr = HiTopsShoeMan;
    for (let  i = 0; i  < 7; i++) {
        let content = `
        <img src=\"${arr[i].img1}\" alt=\"lorem ippsum dolor dummy\" title=\"lorem ippsum dolor dummy\" class=\"img-responsive\" /> 
        `
   $(`#feature-product-img-${i}`).append(content);
   $(`#feature-product-title-${i}`).text(`${arr[i].name}`);
   $(`#feature-product-newPrice-${i}`).text(`${arr[i].price}$`);
   let oldPrice = parseInt(`${arr[i].price}`) +20;
   $(`#feature-product-oldPrice-${i}`).text(oldPrice+".00$");
}


}

$(window).ready(displayFeaturedProduct);