// search at top
$(function() {
    $(".input-text-search-top").click(() => {
        $(".contain-search-popular").css("display", "flex");
    });
    $(".contain-search").mouseleave(() => {
        $(".contain-search-popular").css("display", "none");
    });
});


// display filter search when click {
$(function(){ 
    $(".toggle-filter-search").click(() => {
        $(".contain-filter-search").slideToggle("show");
    });
});




function displayMenuNavigation() {
    let content = `<div class="nav-inner">
                            <div class="navbar-header-menu"><span id="category" class="visible-xs">Categories</span>
                            </div>
                            <div class="navbar-collapse">
                                <ul class="main-navigation">
                                    <li><a href="index.html" class="parent">Home</a> </li>
                                    <li><a href="category.html" class="parent category-item" id="category-man"> Man <i class="fas fa-caret-down"></i> </a>
                                    
                                    <ul class="man-category">
                                    <li id="hitops-man" class="category-product category-product-man">HiTops</li>
                                    <li id="running-man"  class="category-product category-product-man">Running</li>
                                    <li id="slides-man"  class="category-product category-product-man">Slides</li>
                                    <li id="sneakers-man"  class="category-product category-product-man">Sneakers</li>
                                    <li id="skateboard-man"  class="category-product category-product-man">SkateBoard</li>
                                    <li id="football-man"  class="category-product category-product-man">Football</li>

                                </ul>
                            
                                </li>
                                    <li><a href="category.html" class="parent category-item" id="category-woman">Woman <i class="fas fa-caret-down"></i></a>
                                    
                                    <ul class="woman-category">
                                    <li id="hitops-woman" class="category-product category-product-woman">HiTops</li>
                                    <li id="running-woman"  class="category-product category-product-woman">Running</li>
                                    <li id="slides-woman"  class="category-product category-product-woman">Slides</li>
                                    <li id="sneakers-woman"  class="category-product category-product-woman">Sneakers</li>
                                    <li id="skateboard-woman"  class="category-product category-product-woman">SkateBoard</li>
                                    <li id="football-woman"  class="category-product category-product-woman">Football</li>

                                </ul>

                                    </li>
                                     <li><a href="category.html" class="parent category-item" id="category-brand">Brands <i class="fas fa-caret-down"></i></a></li>
                                    <li><a href="blog.html" class="parent">Blog</a></li>
                                    <li><a href="about-us.html">About us</a></li>
                                </ul>
                                <div class="nav-detail-info">
                
    
                                    <div class="item-nav-detail-info" id="item-category-brand">
                                        <div class="contain-brand">
                                           <img onclick="location.href='category.html'" src="image/brand/logo-brand-01.svg">
                                            <img onclick="location.href='category.html'" src="image/brand/logo-brand-02.svg">
                                            <img onclick="location.href='category.html'" src="image/brand/logo-brand-03.svg">
                                            <img onclick="location.href='category.html'" src="image/brand/logo-brand-04.svg">
                                            <img onclick="location.href='category.html'" src="image/brand/logo-brand-05.svg">
                                            <img onclick="location.href='category.html'" src="image/brand/logo-brand-06.svg">
                                            <img onclick="location.href='category.html'" src="image/brand/logo-brand-07.svg">
                                            <img onclick="location.href='category.html'" src="image/brand/logo-brand-08.svg">
                                           <img onclick="location.href='category.html'" src="image/brand/logo-brand-09.svg">
                                            <img onclick="location.href='category.html'" src="image/brand/logo-brand-10.svg>
                                        </div>
                                   </div>
        
                             </div>
                            </div>
                         </div>`;
    $("#menu-navigation").append(content);
};

$(displayMenuNavigation);


// click price search in filter search
$(function() {
    $("#price-search-01").click(() => {
        $("#price-search-01").css("background-color", "#5f2525");
    });
    $("#price-search-02").click(() => {
        $("#price-search-02").css("background-color", "#5f2525");
    });
    $("#price-search-03").click(() => {
        $("#price-search-03").css("background-color", "#5f2525");
    });
});


// responsive navigation
$(function() {
    $("#category-man").mouseover(() => {
        setUpCategoryNav();
        $('.man-category').addClass('display-sub-nav');

    });
    $("#category-woman").mouseover(() => {
        setUpCategoryNav();
        $('.woman-category').addClass('display-sub-nav');
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

    $(".man-category").mouseover(() => {
        $('.man-category').addClass('display-sub-nav');
    });

    $(".woman-category").mouseover(() => {
        $('.woman-category').addClass('display-sub-nav');
    });

    $(".nav-detail-info").mouseover(() => {
        $(".nav-detail-info").css("display", "grid");
    });

    $(".navbar-collapse").mouseout(() => {
        $('.man-category').removeClass('display-sub-nav');
        $('.woman-category').removeClass('display-sub-nav');
        $(".nav-detail-info").css("display", "none");

    });
});

function setUpCategoryNav() {
    $(".nav-detail-info").css("display", "grid");
    $("#item-category-woman").css("display", "none");
    $("#item-category-man").css("display", "none")
    $("#item-category-running").css("display", "none");
    $("#item-category-brand").css("display", "none");
}


let listProduct = [
{brand:"Nike", name:"Air Force One 1", saleRate:"20",oldPrice:"1.200.000", newPrice:"1.000.000",linkImg:"image/product/product-01.jpg"},
{brand:"Nike", name:"Phantom GT Elite Firm Ground Football Boots Juniors", saleRate:"25",oldPrice:"1.900.000", newPrice:"800.000",linkImg:"image/product/product-02.jpg"},
{brand:"Nike", name:"Air Force One 1", saleRate:"20",oldPrice:"1.200.000", newPrice:"1.500.000",linkImg:"image/product/product-03.webp"},
{brand:"Nike", name:"Air Force One 1", saleRate:"30",oldPrice:"2.200.000", newPrice:"1.900.000",linkImg:"image/product/product-04.webp"},
{brand:"Nike", name:"Air Force One 1", saleRate:"15",oldPrice:"3.200.000", newPrice:"2.200.000",linkImg:"image/product/product-05.webp"},
{brand:"Nike", name:"Air Force One 1", saleRate:"10",oldPrice:"2.200.000", newPrice:"1.800.000",linkImg:"image/product/product-06.jpg"},
{brand:"Nike", name:"Air Force One 1", saleRate:"2",oldPrice:"3.200.000", newPrice:"1.200.000",linkImg:"image/product/product-07.webp"},
{brand:"Nike", name:"Air Force One 1", saleRate:"12",oldPrice:"2.200.000", newPrice:"2.000.000",linkImg:"image/product/product-08.jpg"},
{brand:"Nike", name:"Air Force One 1", saleRate:"15",oldPrice:"3.200.000", newPrice:"3.000.000",linkImg:"image/product/product-09.webp"},


]
function displayListProduct() {    
    listProduct.forEach(element => {
        let contain = `<div class="product-layout product-grid col-lg-4 col-md-5 col-sm-6 col-xs-10">
        <div class="product-thumb">
          <div class="image product-imageblock">
            <a href="product.html">
                <div class="related-product-sale">
                   <h5 style='margin-top: 10px'> -20%</h5>
                 </div>
<img id="imgCategory" src="${element.linkImg}" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive item-img-list" /> </a>
            <div class="button-group">
              <button type="button" class="addtocart-btn">Mua ngay</button>
            </div>
          </div>
          <div class="caption product-detail">
         <h2 id="brandCategory" style='margin-top: 5px; text-transform: uppercase'>${element.brand}</h2>
            <h4 class="product-name">
<a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy" style='text-transform: capitalize'>
${element.name}</a> </h4> 
            <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to 40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go. Cover
              Flow. Browse through your music collection by flipping..</p> 
            <p id="priceCategory" class="price product-price"><span class="price-old" style='margin-right: 10px'>${element.oldPrice} VND</span>${element.newPrice} VND </p>
            <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>                                    </div>
          </div>
          <div class="button-group">
            <button type="button" class="addtocart-btn">Mua ngay</button>
          </div>
        </div>
      </div>`;
$(".grid-list-wrapper").append(contain);
    });

    
}






/* display listProduct by click navigation*/
$(function() {
    let man = $(".category-product");
    for (let i = 0; i < man.length; i++) {
        man[i].addEventListener("click", (e) => {
            $(".contain-carousel-category").css("display", "none");
            displayListProduct();
            displayPagination()
            return;
        });
    }
})

// to set category man or category woman
$(function () {
    $("#category-man").click(() => {
        localStorage.setItem("currentPageCategory", "man");
        localStorage.setItem("categoryByNav", "");
           $(".contain-carousel-category").css("display", "block");
           $(".grid-list-wrapper").empty();
    });
    $("#category-woman").click(() => {
        localStorage.setItem("currentPageCategory", "woman");
        localStorage.setItem("categoryByNav", "");
        $(".contain-carousel-category").css("display", "block"); 
        $(".grid-list-wrapper").empty();
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




function loadImageCarouselAndIntroduceCategory() {
    if (localStorage.getItem("currentPageCategory") == "man") {
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



function displayPagination() {   
    let contain = "<span>Page  </span><select id=\"selectPagination\">";
    for (let i = 1; i <= 9; i++)
        contain += `<option value="${i}">${i}</option>`
    contain += `</select> <span> of 9 </span>`;
    $(".pagination").append(`<li><a href="#" id="left-page">&lt;</a></li><li><a href="#" id="right-page">&gt;</a></li>`);
    $(".pagination").append(contain);
    $(`#selectPagination option[value=1]`).attr('selected', 'selected');
};



function displaySizeShoe() {
    let sizeArr = [34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45]
    sizeArr.forEach((value) => {
        $(".contain-dropdown-size").append(
            " <label class=\"checkbox-filter-search\">\n" +
            " <input name=\"filter[]\" type=\"checkbox\" value=\"1\" />\n" +
            value + "</label>"
        );
    });
}

$(displaySizeShoe)


// access information of page costumer
function accessInfoCustomer() {
    $("#nav-info-customer").click(() => {
        resetAllSectionCustomer();
        $("#info-customer").css("display", "block");
        $("#nav-info-customer").addClass("customer-category-after-click");
    });
    $("#nav-bank-customer").click(() => {
        resetAllSectionCustomer();
        $("#bank-customer").css("display", "block");
        $("#nav-bank-customer").addClass("customer-category-after-click");
    });
    $("#nav-map-customer").click(() => {
        resetAllSectionCustomer();
        $("#map-customer").css("display", "block");
        $("#nav-map-customer").addClass("customer-category-after-click");
    });
    $("#nav-password-customer").click(() => {
        resetAllSectionCustomer();
        $("#password-customer").css("display", "block");
        $("#nav-password-customer").addClass("customer-category-after-click");
    });
    // $("#nav-cart-customer").click(() => {
    //     resetAllSectionCustomer();
    //     $("#cart-customer").css("display", "block");
    //     $("#nav-cart-customer").addClass("customer-category-after-click");
    // });
    $("#nav-history-customer").click(() => {
        resetAllSectionCustomer();
        $("#history-customer").css("display", "block");
        $("#nav-history-customer").addClass("customer-category-after-click");
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
    $("#nav-info-customer").removeClass("customer-category-after-click");
    $("#nav-bank-customer").removeClass("customer-category-after-click");
    $("#nav-map-customer").removeClass("customer-category-after-click");
    $("#nav-password-customer").removeClass("customer-category-after-click");
    // $("#nav-cart-customer").removeClass("customer-category-after-click");
    $("#nav-history-customer").removeClass("customer-category-after-click");
    $("#info-customer").css("display", "none");
    $("#bank-customer").css("display", "none");
    $("#map-customer").css("display", "none");
    $("#password-customer").css("display", "none");
    // $("#cart-customer").css("display", "none");
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
    let location = new XMLHttpRequest();
    location.open("GET", "data/location/city.js");
    location.send();
    location.onload = function () {
        let cities = JSON.parse(location.responseText);
        let city = "";
        cities.forEach((element) => {
            city += "<option value=\"" + element.code + "\"" + "class=\"city\">" + element.name + "</option>\n";
        });
        $("#contain-option-city").append(city);
    }
}

function loadDistrict(districtCode) {
    let location = new XMLHttpRequest();
    location.open("GET", "data/location/district.js");
    location.send();
    location.onload = function () {
        let data = JSON.parse(location.responseText);
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
    let location = new XMLHttpRequest();
    location.open("GET", "data/location/ward.js");
    location.send();
    location.onload = function () {
        let data = JSON.parse(location.responseText);
        let wardArr = data.filter((value) => value.parent_code == wardCode);
        let ward = "";
        wardArr.forEach((element) => {
            ward += "<option value=\"" + element.code + "\"" + "class=\"ward\">" + element.name + "</option>\n";
        });
        $("#contain-option-ward").text("");
        $("#contain-option-ward").append(ward);
    }
}

