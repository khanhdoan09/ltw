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

// click price search
$(function() {
    $("#price-search-01").click(() => {
        $("#price-search-01").toggleClass("price-search-clicked");
    });
    $("#price-search-02").click(() => {
        $("#price-search-02").toggleClass("price-search-clicked");
    });
    $("#price-search-03").click(() => {
        $("#price-search-03").toggleClass("price-search-clicked");
    });
})




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
    constructor(img, brand, name, price) {
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
        // MAKE A REFERNCE TO FIREBASE .
        const storageRef = firebase.storage().ref()
        const final = storageRef.child(src + `/${value.img1}.jpg`)

        final.getDownloadURL().then(url => {
            let contain = "<div class=\"product-layout product-grid col-lg-4 col-md-5 col-sm-6 col-xs-10\">\n" +
                "          <div class=\"product-thumb\">\n" +
                "            <div class=\"image product-imageblock\">\n" +
                "              <a href=\"product.html\">" +
                "                  <div class=\"related-product-sale\">\n" +
                "                     <h5 style='margin-top: 10px'>" + value.saleRate +"%</h5>\n" +
                "                   </div>" +
                " <img id=\"imgCategory" + i + "\" src=\"" + url + "\" alt=\"lorem ippsum dolor dummy\" title=\"lorem ippsum dolor dummy\" class=\"img-responsive\" /> </a>\n" +
                "              <div class=\"button-group\">\n" +
                "                <button type=\"button\" class=\"wishlist\" data-toggle=\"tooltip\" title=\"Thêm vào yêu thích\"><i class=\"fas fa-heart\"></i></button>\n" +
                "                <button type=\"button\" class=\"addtocart-btn\">Mua ngay</button>\n" +
                "                <button type=\"button\" class=\"compare\" data-toggle=\"tooltip\" title=\"Thêm vào giỏ hàng\"><i class=\"fas fa-shopping-cart\"></i></button>\n" +
                "              </div>\n" +
                "            </div>\n" +
                "            <div class=\"caption product-detail\">\n" +
                "           <h2 id=\"brandCategory" + i + "\" style='margin-top: 5px; text-transform: uppercase'>" + value.brand + "</h2>" +
                "              <h4 class=\"product-name\"> " +
                "<a id=\"nameCategory" + i + "\" href=\"product.html\" title=\"lorem ippsum dolor dummy\" style='text-transform: capitalize'>" +
                value.name + " </a> </h4>\n" +
                "              <p class=\"product-desc\"> More room to move. With 80GB or 160GB of storage and up to 40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go. Cover\n" +
                "                Flow. Browse through your music collection by flipping..</p>\n" +
                "              <p id=\"priceCategory" + i + "\" class=\"price product-price\"><span class=\"price-old\" style='margin-right: 10px'>" + value.price + 0 + "$</span>" + value.salePrice + "$<span class=\"price-tax\">Ex Tax: $100.00</span> </p>\n" +
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
        })


    }
}

function myDisplay(value) {
    window.location.assign("category.html");

}
// set up value introduction category
$(function () {
    $("#category-man").click(() => {
        localStorage.setItem("currentPageCategory", "man");
        localStorage.setItem("categoryByNav", "");
        $("#category-carousel-intro-1").attr("src", "image/banners/men-intro-carousel1.webp");
        $("#category-carousel-intro-2").attr("src", "image/banners/men-intro-carousel2.webp");
        $("#category-carousel-intro-3").attr("src", "image/banners/men-intro-carousel3.webp");


        ; // window don't auto use loadDataAfterChooseCategoryByNavigation() after direct page
        $(".contain-carousel-category").css("display", "block");
    });
    $("#category-woman").click(() => {
        localStorage.setItem("currentPageCategory", "woman");
        localStorage.setItem("categoryByNav", "");

        $(".contain-carousel-category").css("display", "block");
    });
});

let listIntroCategoryMan = [];
listIntroCategoryMan.push("data/product/Shoe/HiTops/HiTopsMan.js");
listIntroCategoryMan.push("data/product/Shoe/Running/RunningMan.js");
listIntroCategoryMan.push("data/product/Shoe/Slides/SlidesMan.js");
listIntroCategoryMan.push("data/product/Shoe/Sneakers/SneakersMan.js");
listIntroCategoryMan.push("data/product/Shoe/SkateBoard/SkateBoardMan.js");
listIntroCategoryMan.push("data/product/Shoe/Football/FootballMan.js");
let listIntroCategoryWoman = [];
listIntroCategoryWoman.push("data/product/Shoe/HiTops/HiTopsWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/Running/RunningWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/Slides/SlidesWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/Sneakers/SneakersWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/SkateBoard/SkateBoardWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/Football/FootballWoman.js");


// // select category by introduction
// $(function () {
//     let arr = $(".intro-category");
//     for (let i = 0; i < arr.length; i++) {
//         arr[i].addEventListener("click", (e) => {
//             if (localStorage.getItem("currentPageCategory") == "man")
//                 src = listIntroCategoryMan[i];
//             else
//                 src = listIntroCategoryWoman[i];
//             $(".contain-carousel-category").css("display", "none");
//             getData(src);
//             return;
//         });
//     }
// });

//
// // select category by navigation
// $(function () {
//     let arrMan = $(".category-product-man");
//     for (let i = 0; i < arrMan.length; i++) {
//         arrMan[i].addEventListener("click", (e) => {
//             if (!window.location.pathname.includes("category.html")) {
//                 location.href = "category.html"
//                 localStorage.setItem("categoryByNav", listIntroCategoryMan[i] + ""); // window auto use loadDataAfterChooseCategoryByNavigation() after direct page
//             }
//             else {
//                 let src = $("#" + arrMan[i].id).attr("value");
//                 getData(src);
//             }
//             return;
//         });
//     }

//     let arrWoman = $(".category-product-woman");
//     for (let i = 0; i < arrWoman.length; i++) {
//         arrWoman[i].addEventListener("click", (e) => {
//             let src = $("#" + arrMan[i].id).attr("value");
//             if (!window.location.pathname.includes("category.html")) {
//                 location.href = "category.html"
//                 localStorage.setItem("categoryByNav", listIntroCategoryWoman[i] + "");   // window auto use loadDataAfterChooseCategoryByNavigation() after direct page
//             }
//             else
//                 getData(src);
//             return;
//         });
//     }
// });

// loi khi dung sang intellij - nho fix

// function loadDataAfterChooseCategoryByNavigation() {
//
//     let tmp = localStorage.getItem("categoryByNav");
//     if (tmp.length === 0) {
//         $(".contain-carousel-category").css("display", "block");
//     }
//     else {
//         getData(tmp);
//         $(".contain-carousel-category").css("display", "none");
//     }
//
// }
// $(window).ready(loadDataAfterChooseCategoryByNavigation);

function loadImageCarouselAndIntroduceCategory() {
    if (localStorage.getItem("currentPageCategory") == "man") {
        $("#intro-running").click(()=>{
            location.href = "CategoryProduct?categoryProduct=runningManCategory";
        })
        $("#intro-slides").click(()=>{
            location.href = "CategoryProduct?categoryProduct=slidesManCategory";
        })
        $("#intro-sneakers").click(()=>{
            location.href = "CategoryProduct?categoryProduct=sneakersManCategory";
        })
        $("#intro-skateboard").click(()=>{
            location.href = "CategoryProduct?categoryProduct=skateboardManCategory";
        })
        $("#category-carousel-intro-1").attr("src", "image/banners/men-intro-carousel1.webp");
        $("#category-carousel-intro-2").attr("src", "image/banners/men-intro-carousel2.webp");
        $("#category-carousel-intro-3").attr("src", "image/banners/men-intro-carousel-3.jpg");
        $("#category-intro-img-hitops").attr("src", "image/category/man-Hitops.webp");
        $("#category-intro-img-running").attr("src", "image/category/man-running.webp");
        $("#category-intro-img-slides").attr("src", "image/category/man-slides.jpg");
        $("#category-intro-img-football").attr("src", "image/category/man-football.webp");
        $("#category-intro-img-sneakers").attr("src", "image/category/man-sneakers.jpg");
        $("#category-intro-img-skateboard").attr("src", "image/category/man-skateboard.jpg");
    }
    else {
        $("#intro-running").click(()=>{
            location.href = "CategoryProduct?categoryProduct=runningWomanCategory";
        })
        $("#intro-slides").click(()=>{
            location.href = "CategoryProduct?categoryProduct=slidesWomanCategory";
        })
        $("#intro-sneakers").click(()=>{
            location.href = "CategoryProduct?categoryProduct=sneakersWomanCategory";
        })
        $("#intro-skateboard").click(()=>{
            location.href = "CategoryProduct?categoryProduct=skateboardWomanCategory";
        })
        $("#category-carousel-intro-1").attr("src", "image/banners/women-intro-carousel1.webp");
        $("#category-carousel-intro-2").attr("src", "image/banners/women-intro-carousel2.webp");
        $("#category-carousel-intro-3").attr("src", "image/banners/women-intro-carousel3.webp");
        $("#category-intro-img-hitops").attr("src", "image/category/woman-hitops.jpg");
        $("#category-intro-img-running").attr("src", "image/category/running-woman.webp");
        $("#category-intro-img-slides").attr("src", "image/category/woman-slide.jpg");
        $("#category-intro-img-football").attr("src", "image/category/woman-football.jfif");
        $("#category-intro-img-sneakers").attr("src", "image/category/woman-sneakers.webp");
        $("#category-intro-img-skateboard").attr("src", "image/category/woman-skateboard.jfif");
    }
}
$(window).ready(loadImageCarouselAndIntroduceCategory);



// use call back
// get data to display category and pagination
function getData(src) {

    let test = new XMLHttpRequest();

    // let test = new XMLHttpRequest();
    test.open("GET", src);
    test.send();
    test.onload = function () {
        let data = JSON.parse(test.responseText);
        displayPagination(data);
        getPositionPagination(data, src);
    }
}
function displayPagination(data) {
    $(".pagination").empty(); // restart when change category
    let num = Math.ceil(data.length / 9) - 1;
    let contain = "<span>Page  </span><select id=\"selectPagination\">";
    for (let i = 1; i <= num; i++)
        contain += `<option value="${i}">${i}</option>`
    contain += `</select> <span> of ${num} </span>`;
    $(".pagination").append(`<li><a id="left-page">&lt;</a></li><li><a id="right-page">&gt;</a></li>    `);
    $(".pagination").append(contain);
    $(`#selectPagination option[value=1]`).attr('selected', 'selected');
}


// to update category product
let currentPagination = 1;
function getPositionPagination(data, src) {
    src = src.substring(src.lastIndexOf("/"), src.indexOf(".js")); // remove extension js and first bla bla
    let num = Math.ceil(data.length / 9);
    displayCategory(0, data, src); // init
    // let pos = 1;
    $("#selectPagination").on('change', function () {
        $("html, body").animate({
            scrollTop: 0
        }, 1000);
        $(`#selectPagination option[value=${currentPagination}]`).removeAttr('selected');
        $(`#selectPagination option[value=${$(this).val()}]`).attr('selected', 'selected');
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
                    $(`#selectPagination option[value=${currentPagination}]`).attr('selected', 'selected');
                    document.querySelector("#selectPagination").value = currentPagination;
                    replaceProductPagination(currentPagination, data, src);
                    return;
                }
            }
            else if (pos == "<") {
                $("html, body").animate({
                    scrollTop: 0
                }, 500);
                if (currentPagination != 1) {
                    $(`#selectPagination option[value=${currentPagination}]`).removeAttr('selected');
                    currentPagination = +currentPagination - 1;
                    $(`#selectPagination option[value=${currentPagination}]`).attr('selected', 'selected');
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
        const final = storageRef.child(src + `/${value.img1}.jpg`)
        final.getDownloadURL().then(url => {
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

$(function () {
    loadDefaultLocation();
    $('#contain-option-city').on('change', function () {
        let cityCode = $(this).val();
        loadDistrict(cityCode);
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
});

function loadDefaultLocation() {
    loadCity();
    loadDistrict(89,);
    loadWard(883);
}

function loadCity() {
    let test = new XMLHttpRequest();
    // let test = new XMLHttpRequest();
    test.open("GET", "data/location/city.js");
    test.send();
    test.onload = function () {
        let cities = JSON.parse(test.responseText);
        let city = "";
        cities.forEach((element) => {
            city += "<option value=\"" + element.code + "\"" + "class=\"city\">" + element.name + "</option>\n";
        });
        $("#contain-option-city").append(city);
    }
}

function loadDistrict(districtCode) {
    let test = new XMLHttpRequest();
    // let test = new XMLHttpRequest();
    test.open("GET", "data/location/district.js");
    test.send();
    test.onload = function () {
        let data = JSON.parse(test.responseText);
        districtArr = data.filter((value) => value.parent_code == districtCode);
        let district = "";
        districtArr.forEach((element) => {
            district += "<option value=\"" + element.code + "\"" + "class=\"district\">" + element.name + "</option>\n";
        });
        $("#contain-option-district").text("");
        $("#contain-option-district").append(district)
    }
}

function loadWard(wardCode) {
    let test = new XMLHttpRequest();
    test.open("GET", "data/location/ward.js");
    test.send();
    test.onload = function () {
        let data = JSON.parse(test.responseText);
        let wardArr = data.filter((value) => value.parent_code == wardCode);
        let ward = "";
        wardArr.forEach((element) => {
            ward += "<option value=\"" + element.code + "\"" + "class=\"ward\">" + element.name + "</option>\n";
        });
        $("#contain-option-ward").text("");
        $("#contain-option-ward").append(ward);
    }
}


// display featured product

// function displayFeaturedProduct() {
//     let test = new XMLHttpRequest();
//     let src = "data/product/Shoe/Running/RunningWoman.js";
//     test.open("GET", src);
//     test.send();
//     test.onload = function() {
//         let arr = JSON.parse(test.responseText);
//         for (let  i = 0; i  < 7; i++) {
//             let value = arr[i];
//             const storageRef = firebase.storage().ref()
//             const final = storageRef.child(`RunningMan/${value.img1}.jpg`)
//              final.getDownloadURL().then(url=>{
//                 $(`#imgCategory${i}`).attr("src", url);
//              });
//             let content = `
//             <img src=\"${arr[i].img1}\" alt=\"lorem ippsum dolor dummy\" title=\"lorem ippsum dolor dummy\" class=\"img-responsive\" />`
//             $(`#feature-product-img-${i}`).append(content);
//             $(`#feature-product-title-${i}`).text(`${arr[i].name}`);
//             $(`#feature-product-newPrice-${i}`).text(`${arr[i].price}$`);
//             let oldPrice = parseInt(`${arr[i].price}`) +20;
//             $(`#feature-product-oldPrice-${i}`).text(oldPrice+".00$");
//     }
//     }

// }

// $(window).ready(displayFeaturedProduct);

$(function () {
    let test = new XMLHttpRequest();

    // let test = new XMLHttpRequest();
    test.open("GET", "data/product/Shoe/HiTops/HiTopsWoman.js");
    test.send();
    test.onload = function () {
        let data = JSON.parse(test.responseText);

        let img1 = data[0].img1;
        let img2 = data[0].img2;
        let img3 = data[0].img3;
        let img4 = data[0].img4;
        let img5 = data[0].img5;
        let img6 = data[0].img6;
        let img7 = data[0].img7;

        // MAKE A REFERNCE TO FIREBASE .
        const storageRef = firebase.storage().ref()

        const final1 = storageRef.child(`HiTopsWoman/${img1}.jpg`)
        final1.getDownloadURL().then(url => {
            $("#main-img").attr("src", url)
        });
        const final2 = storageRef.child(`HiTopsWoman/${img2}.jpg`)
        final2.getDownloadURL().then(url => {
            $("#zero").attr("src", url)
        });
        const final3 = storageRef.child(`HiTopsWoman/${img3}.jpg`)
        final3.getDownloadURL().then(url => {
            $("#one").attr("src", url)
        });
        const final4 = storageRef.child(`HiTopsWoman/${img4}.jpg`)
        final4.getDownloadURL().then(url => {
            $("#two").attr("src", url)
        });
        const final5 = storageRef.child(`HiTopsWoman/${img5}.jpg`)
        final5.getDownloadURL().then(url => {
            $("#three").attr("src", url)
        });
        const final6 = storageRef.child(`HiTopsWoman/${img6}.jpg`)
        final6.getDownloadURL().then(url => {
            $("#four").attr("src", url)
        });
    }
});


$(function () {
    let test = new XMLHttpRequest();
    // let test = new XMLHttpRequest();
    test.open("GET", "data/product/Shoe/HiTops/HiTopsWoman.js");
    test.send();
    test.onload = function () {
        let data = JSON.parse(test.responseText);
        // MAKE A REFERNCE TO FIREBASE .
        const storageRef = firebase.storage().ref()
        for (let i = 0; i < data.length; i++) {
            img1 = data[i].img1;
            const final1 = storageRef.child(`HiTopsWoman/${img1}.jpg`)
            final1.getDownloadURL().then(url => {
                $("#feature-product-img-" + i).attr("src", url)
                $("#feature-product-title-" + i).text(data[i].name)
            });
        }
    }
});



// refactor data
// $(function () {
//     let test = new XMLHttpRequest();

//     // let test = new XMLHttpRequest();
//     test.open("GET", "data/product/Shoe/HiTops/HiTopsWoman.js");
//     test.send();
//     test.onload = function () {
//         let data = JSON.parse(test.responseText);
//        let re = "[";
//     data.forEach(obj => {
//        for (let i in obj) {
//            if (i.length == 4 && i != "name" && i != "sale" )
//                delete obj[i]
//                if (i.length == 5 && i != "price" && i != "brand" )
//                delete obj[i]
//        }
//        delete obj.sku
//         re+="\n"
//         obj.date = Math.floor(Math.random() * 28 + 1)+"/"+Math.floor(Math.random() * 12 + 1)+"/"+Math.floor(Math.random() * (2021 - 2018) + 2018)
//         obj.starRate = Math.floor(Math.random() * (5 - 3) + 3) ;
//         obj.totalValue = Math.floor(Math.random() * (150 - 80) + 80)
//         obj.soleValue = Math.floor(Math.random() * (80 - (10*obj.starRate)) + (10*obj.starRate))
//         obj.saleRate = Math.floor(Math.random() * 50);
//         obj.salePrice = parseFloat(obj.price) - parseFloat(obj.price) * parseFloat(obj.saleRate) / 100;
//         re += JSON.stringify(obj) + "\n,";
//     });
//     re+="\n]"
//     console.log(re);
//     }
// });


