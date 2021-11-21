// search at top

function searchPopular() {
    $(".input-text-search-top").click(() => {
        $(".contain-search-popular").css("display", "flex");
    });
    $(".contain-search").mouseleave(() => {
        $(".contain-search-popular").css("display", "none");
    });
}

$(window).ready(searchPopular);

// filter search {
function toggleFilterSearch() {
    $(".toggle-filter-search").click(() => {
        $(".contain-filter-search").slideToggle("show");
    });
}

$(window).ready(toggleFilterSearch);


// menu-navigation
function menuNavigation() {
    let content = "<div class=\"nav-inner\">\r\n"
    + "                    <div class=\"navbar-header-menu\"><span id=\"category\" class=\"visible-xs\">Categories</span>\r\n"
    + "                        <button type=\"button\" class=\"btn btn-navbar navbar-toggle\"><i class=\"fa fa-bars\"></i></button>\r\n"
    + "                    </div>\r\n"
    + "                    <div class=\"navbar-collapse\">\r\n"
    + "                        <ul class=\"main-navigation\">\r\n"
    + "                            <li><a href=\"index.html\" class=\"parent\">Home</a> </li>\r\n"
    + "                            <li><a href=\"category.html\" class=\"parent category-item\" id=\"category-man\"> Man <i class=\"fas fa-caret-down\"></i></a></li>\r\n"
    + "                            <li><a href=\"category.html\" class=\"parent category-item\" id=\"category-woman\">Woman <i class=\"fas fa-caret-down\"></i></a></li>\r\n"
    + "                            <li><a href=\"category.html\" class=\"parent category-item\" id=\"category-brand\">Brands <i class=\"fas fa-caret-down\"></i></a></li>\r\n"
    + "                            <li><a href=\"blog.html\" class=\"parent\">Blog</a></li>\r\n"
    + "                            <li><a href=\"about-us.html\">About us</a></li>\r\n"
    + "                        </ul>\r\n"
    + "                        <div class=\"nav-detail-info\">\r\n"
    + "                            <div class=\"item-nav-detail-info\" id=\"item-category-man\">\r\n"
    + "                                <ul>\r\n"
    + "                                    <li href=\"category.html\" id=\"hitops-man\" value=\"data/product/Shoe/HiTops/HiTopsMan.js\" class=\"category-product\">HiTops</li>\r\n"
    + "                                    <li id=\"running-man\" value=\"data/product/Shoe/Running/RunningMan.js\" class=\"category-product\">Running</li>\r\n"
    + "                                    <li id=\"slides-man\" value=\"data/product/Shoe/Slides/SlidesMan.js\" class=\"category-product\">Slides</li>\r\n"
    + "                                    <li id=\"sneakers-man\" value=\"data/product/Shoe/Sneakers/SneakersWoman.js\" class=\"category-product\">Sneakers</li>\r\n"
    + "                                    <li id=\"skateboard-man\" value=\"data/product/Shoe/SkateBoard/SkateBoardMan.js\" class=\"category-product\">SkateBoard</li>\r\n"
    + "                                    <li id=\"football-man\" value=\"data/product/Shoe/Football/FootballMan.js\" class=\"category-product\">Football</li>\r\n"
    + "\r\n"
    + "                                    <!-- <li id=\"trainer-man\" value=\"data/product/Shoe/Trainers/TrainersMan.js\" class=\"category-product\">Trainers</li> -->\r\n"
    + "                                </ul>\r\n"
    + "                               \r\n"
    + "                            </div>\r\n"
    + "\r\n"
    + "                            <div class=\"item-nav-detail-info\" id=\"item-category-woman\">\r\n"
    + "                                <ul>\r\n"
    + "                                    <li id=\"hitops-woman\" value=\"data/product/Shoe/HiTops/HiTopsWoman.js\" class=\"category-product\">HiTops</li>\r\n"
    + "                                    <li id=\"slides-woman\" value=\"data/product/Shoe/Slides/SlidesWoman.js\" class=\"category-product\">Slides</li>\r\n"
    + "                                    <li id=\"sneakers-woman\" value=\"data/product/Shoe/Sneakers/SneakersWoman.js\" class=\"category-product\">Sneakers</li>\r\n"
    + "                                    <li id=\"skateboard-woman\" value=\"data/product/Shoe/SkateBoard/SkateBoardWoman.js\" class=\"category-product\">SkateBoard</li>\r\n"
    + "                                    <li id=\"running-woman\" value=\"data/product/Shoe/Running/RunningWoman.js\" class=\"category-product\">Running</li>\r\n"
    + "                                    <li id=\"football-woman\" value=\"data/product/Shoe/Football/FootballWoman.js\" class=\"category-product\">Football</li>\r\n"
    + "\r\n"
    + "\r\n"
    + "                                </ul>\r\n"
    + "                            </div>\r\n"
    + "\r\n"
    + "                            <div class=\"item-nav-detail-info\" id=\"item-category-brand\">\r\n"
    + "                                <div class=\"contain-brand\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-01.svg\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-02.svg\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-03.svg\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-04.svg\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-05.svg\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-06.svg\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-07.svg\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-08.svg\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-09.svg\">\r\n"
    + "                                    <img src=\"image/brand/logo-brand-10.svg\">\r\n"
    + "                                </div>\r\n"
    + "                            </div>\r\n"
    + "\r\n"
    + "\r\n"
    + "\r\n"
    + "                        </div>\r\n"
    + "                    </div>\r\n"
    + "                </div>";

    $("#menu-navigation").append(content);
}

$(window).ready(menuNavigation);
// dropdown
// function dropdownLocate() {
//     $(".open-dropdown-locate").click(() => {
//         $(".dropdown-locate").css("display", "inline");
//         $(".open-dropdown-locate").css("display", "none");
//         $(".close-dropdown-locate").css("display", "inline");
//         $(".contain-dropdown-locate").css("height", "450px");
//     });

//     $(".close-dropdown-locate").click(() => {
//         $(".dropdown-locate").css("display", "none");
//         $(".open-dropdown-locate").css("display", "inline");
//         $(".close-dropdown-locate").css("display", "none");
//         $(".contain-dropdown-locate").css("height", "250px");
//     });
// }

// $(window).ready(dropdownLocate);

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
    $("#category-man").mouseover(() => {
        setUpCategoryNav();
        $("#item-category-man").css("display", "flex");
        if ($(window).width() < 750) {
            $(".nav-detail-info").css("top", "80px");
            $(".nav-detail-info").css("left", "-120px");
            $("#item-category-man").css("width", "30%");
        }
    });
    $("#category-woman").mouseover(() => {
        setUpCategoryNav();
        $("#item-category-woman").css("display", "flex");
        if ($(window).width() < 750) {
        $(".nav-detail-info").css("top", "120px");
        $(".nav-detail-info").css("left", "-150px");
        $("#item-category-woman").css("width", "30%");
        }
        });
    
    $("#category-brand").mouseover(() => {
        setUpCategoryNav();
        $("#item-category-brand").css("display", "flex");
        if ($(window).width() < 750) {
            $(".nav-detail-info").css("top", "120px");
            $(".nav-detail-info").css("left", "0px");
            $("#item-category-brand").css("width", "100%");
            }
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
    $("#item-category-woman").css("display", "none");
    $("#item-category-man").css("display", "none")
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
class ProductPagination {
    constructor(img,  brand, name, price) {
        this.img = img;
        this.brand = brand;
        this.name = name;
        this.price = price;
    }
}


let listProductPagination = [];

function displayCategory(position = 0, data, src) {

   let arrProduct = data;
    $(".grid-list-wrapper").text(""); // reset after choose pagination
    for (let i = position * 9; i < (position * 9) + 9; i++) {
        if (i == arrProduct.length)
            break;
        let value = arrProduct[i];
        let pp = new ProductPagination(value.img1, value.brand, value.name, value.price);
            let img = pp.img;
            // MAKE A REFERNCE TO FIREBASE .
            const storageRef = firebase.storage().ref()
        const final =storageRef.child(src+`/${img}.jpg`)

         final.getDownloadURL().then(url=>{
            let contain = "<div class=\"product-layout product-grid col-lg-4 col-md-5 col-sm-6 col-xs-10\">\n" +
            "          <div class=\"product-thumb\">\n" +
            "            <div class=\"image product-imageblock\">\n" +
            "              <a href=\"product.html\">" +
            "                  <div class=\"related-product-sale\">\n" +
            "                     <h5 style='margin-top: 10px'>" + 10 % +"</h5>\n" +
            "                   </div>" +
            " <img id=\"imgCategory"+i+"\" src=\"" + url + "\" alt=\"lorem ippsum dolor dummy\" title=\"lorem ippsum dolor dummy\" class=\"img-responsive\" /> </a>\n" +
            "              <div class=\"button-group\">\n" +
            "                <button type=\"button\" class=\"wishlist\" data-toggle=\"tooltip\" title=\"Thêm vào yêu thích\"><i class=\"fas fa-heart\"></i></button>\n" +
            "                <button type=\"button\" class=\"addtocart-btn\">Mua ngay</button>\n" +
            "                <button type=\"button\" class=\"compare\" data-toggle=\"tooltip\" title=\"Thêm vào giỏ hàng\"><i class=\"fas fa-shopping-cart\"></i></button>\n" +
            "              </div>\n" +
            "            </div>\n" +
            "            <div class=\"caption product-detail\">\n" +
            "           <h2 id=\"brandCategory"+i+"\" style='margin-top: 5px; text-transform: uppercase'>" + pp.brand + "</h2>" +
            "              <h4 class=\"product-name\"> " +
            "<a id=\"nameCategory"+i+"\" href=\"product.html\" title=\"lorem ippsum dolor dummy\" style='text-transform: capitalize'>" +
            pp.name + " </a> </h4>\n" +
            "              <p class=\"product-desc\"> More room to move. With 80GB or 160GB of storage and up to 40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go. Cover\n" +
            "                Flow. Browse through your music collection by flipping..</p>\n" +
            "              <p id=\"priceCategory"+i+"\" class=\"price product-price\"><span class=\"price-old\" style='margin-right: 10px'>" + pp.price + 0 + "</span>" + pp.price + " <span class=\"price-tax\">Ex Tax: $100.00</span> </p>\n" +
            "              <div class=\"rating\"> <span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-2x\"></i><i class=\"fa fa-star-o fa-stack-2x\"></i></span> <span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-2x\"></i><i class=\"fa fa-star-o fa-stack-2x\"></i></span>                                    <span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-2x\"></i><i class=\"fa fa-star-o fa-stack-2x\"></i></span> <span class=\"fa fa-stack\"><i class=\"fa fa-star-o fa-stack-2x\"></i></span> <span class=\"fa fa-stack\"><i class=\"fa fa-star-o fa-stack-2x\"></i></span>                                    </div>\n" +
            "            </div>\n" +
            "            <div class=\"button-group\">\n" +
            "              <button type=\"button\" class=\"wishlist\" data-toggle=\"tooltip\" title=\"Thêm vào yêu thích\"><i class=\"fas fa-heart\"></i></button>\n" +
            "              <button type=\"button\" class=\"addtocart-btn\">Mua ngay</button>\n" +
            "              <button type=\"button\" class=\"compare\" data-toggle=\"tooltip\" title=\"Thêm vào giỏ hàng\"><i class=\"fas fa-shopping-cart\"></i></button>\n" +
            "            </div>\n" +
            "          </div>\n" +
            "        </div>";

        $(".grid-list-wrapper").append(contain);        })


    }
}

function myDisplay(value) {
    window.location.assign("category.html");

}
$(function () {
    let arr = $(".category-product");
    for (let i  =0 ; i < arr.length; i++) {
        arr[i].addEventListener("click", (e)=>{
            let src = $("#"+arr[i].id).attr("value");
          if (!window.location.pathname.includes("category.html")) {
                location.href = "category.html"
                }

            getData(src);
            return;
        });
    }
});



// use call back
// get data to display category and pagination
function getData(src) {

    let test = new XMLHttpRequest();
    
    // let test = new XMLHttpRequest();
    test.open("GET", src);
    test.send();
    test.onload = function() {
        let data = JSON.parse(test.responseText);
        displayPagination(data);
        getPositionPagination(data, src);
    }
}
function displayPagination(data) {
    $(".pagination").empty(); // restart when change category
    let num = Math.ceil(data.length / 9)  - 1;
    let contain = "<span>Page  </span><select id=\"selectPagination\">";
    for (let i = 1; i <= num; i++) 
        contain += `<option value="${i}">${i}</option>`
    contain += `</select> <span> of ${num} </span>`;
    $(".pagination").append(`<li><a id="left-page">&lt;</a></li><li><a id="right-page">&gt;</a></li>    `);
    $(".pagination").append(contain);
    $(`#selectPagination option[value=1]`).attr('selected','selected');
}


// to update category product
let currentPagination = 1;
function getPositionPagination(data, src) {
    src = src.substring(src.lastIndexOf("/"), src.indexOf(".js")); // remove extension js and first bla bla
    let num = Math.ceil(data.length / 9);
    displayCategory(0, data, src); // init
    // let pos = 1;
    $("#selectPagination").on('change', function(){
        $("html, body").animate({
            scrollTop: 0
        }, 1000);   
        $(`#selectPagination option[value=${currentPagination}]`).removeAttr('selected');
        $(`#selectPagination option[value=${$(this).val()}]`).attr('selected','selected');
        currentPagination = $(this).val();
        document.querySelector("#selectPagination").value = currentPagination;
        replaceProductPagination(currentPagination, data, src);
    });
    let arrPg = $(".pagination li a");
    for (let i = 0; i < arrPg.length; i++) {
        arrPg[i].addEventListener("click", () => {
            pos = arrPg[i].text;
            if (pos == ">") {
                $("html, body").animate({
                    scrollTop: 0
                }, 1000);    
                if (currentPagination != num) {
                    $(`#selectPagination option[value=${currentPagination}]`).removeAttr('selected');
                    currentPagination = +currentPagination + 1;
                    $(`#selectPagination option[value=${currentPagination}]`).attr('selected','selected');
                    document.querySelector("#selectPagination").value = currentPagination;
                    replaceProductPagination(currentPagination, data, src);
                    return;
                }
            }
            else if (pos == "<") {
                $("html, body").animate({
                    scrollTop: 0
                }, 500); 
                if (currentPagination != 1)  {  
                    $(`#selectPagination option[value=${currentPagination}]`).removeAttr('selected');
                    currentPagination = +currentPagination - 1;
                        $(`#selectPagination option[value=${currentPagination}]`).attr('selected','selected');
                     document.querySelector("#selectPagination").value = currentPagination;
                    replaceProductPagination(currentPagination, data, src); 
                    return;
                }  
            }
        })
        
    };
}

function replaceProductPagination(position, data, src) {
    let arrProduct = data;
    for (let i = position * 9; i < (position * 9) + 9; i++) {
        if (i == arrProduct.length)
            break;
            let value = arrProduct[i];
            let j = +i % 9;
            
            const storageRef = firebase.storage().ref()
            const final = storageRef.child(src+`/${value.img1}.jpg`)
             final.getDownloadURL().then(url=>{
                $(`#imgCategory${j}`).attr("src", url);
                $(`#nameCategory${j}`).text(value.name);
                $(`#brandCategory${j}`).text(value.brand);
                $(`#priceCategory${j}`).text(value.price);
             });
    }
}

function displaySizeInRefineSearch() {
    let sizeArr = [34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45]
    sizeArr.forEach((value) => {
        $(".contain-dropdown-size").append(
            " <label class=\"checkbox-filter-search\">\n" +
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