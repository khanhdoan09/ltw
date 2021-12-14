function loadImageCarouselAndIntroduceCategory() {
    if (localStorage.getItem("currentPageCategory") == "man") {
        $("#intro-running").click(()=>{
            location.href = "CategoryProduct?categoryProduct=runningManCategory&pagination=1";
        })
        $("#intro-slides").click(()=>{
            location.href = "CategoryProduct?categoryProduct=slidesManCategory&pagination=1";
        })
        $("#intro-sneakers").click(()=>{
            location.href = "CategoryProduct?categoryProduct=sneakersManCategory&pagination=1";
        })
        $("#intro-skateboard").click(()=>{
            location.href = "CategoryProduct?categoryProduct=skateboardManCategory&pagination=1";
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
            location.href = "CategoryProduct?categoryProduct=runningWomanCategory&pagination=1";
        })
        $("#intro-slides").click(()=>{
            location.href = "CategoryProduct?categoryProduct=slidesWomanCategory&pagination=1";
        })
        $("#intro-sneakers").click(()=>{
            location.href = "CategoryProduct?categoryProduct=sneakersWomanCategory&pagination=1";
        })
        $("#intro-skateboard").click(()=>{
            location.href = "CategoryProduct?categoryProduct=skateboardWomanCategory&pagination=1";
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
$(window).ready(loadImageCarouselAndIntroduceCategory());




// search at top
$(function() {
    $(".input-text-search-top").click(() => {
        $(".contain-search-popular").css("display", "flex");
    });
    $(".contain-search").mouseleave(() => {
        $(".contain-search-popular").css("display", "none");
    });
});


// filter search when click {
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
                                    <li><a href="category.html" class="parent category-item" id="category-man"> Man <i class="fas fa-caret-down"></i></a></li>
                                    <li><a href="category.html" class="parent category-item" id="category-woman">Woman <i class="fas fa-caret-down"></i></a></li>
                                     <li><a href="category.html" class="parent category-item" id="category-brand">Brands <i class="fas fa-caret-down"></i></a></li>
                                    <li><a href="blog.html" class="parent">Blog</a></li>
                                    <li><a href="about-us.html">About us</a></li>
                                </ul>
                                <div class="nav-detail-info">
                                    <div class="item-nav-detail-info" id="item-category-man">
        
                                        <ul>
                                            <li id="hitops-man" class="category-product category-product-man">HiTops</li>
                                            <li id="running-man"  class="category-product category-product-man">Running</li>
                                            <li id="slides-man"  class="category-product category-product-man">Slides</li>
                                            <li id="sneakers-man"  class="category-product category-product-man">Sneakers</li>
                                            <li id="skateboard-man"  class="category-product category-product-man">SkateBoard</li>
                                            <li id="football-man"  class="category-product category-product-man">Football</li>
        
                                        </ul>
                                    
                                    </div>
        
                                    <div class="item-nav-detail-info" id="item-category-woman">                                        <ul>
                                              <li id="hitops-woman" class="category-product category-product-woman">HiTops</li>
                                            <li id="running-woman"  class="category-product category-product-woman">Running</li>
                                           <li id="slides-woman"  class="category-product category-product-woman">Slides</li>
                                            <li id="sneakers-woman"  class="category-product category-product-woman">Sneakers</li>
                                            <li id="skateboard-woman"  class="category-product category-product-woman">SkateBoard</li>
                                            <li id="football-woman"  class="category-product category-product-woman">Football</li>
        
        
                                       </ul>
                                    </div>
    
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
});

function setUpCategoryNav() {
    $(".nav-detail-info").css("display", "grid");
    $("#item-category-woman").css("display", "none");
    $("#item-category-man").css("display", "none")
    $("#item-category-running").css("display", "none");
    $("#item-category-brand").css("display", "none");
}


function displayListProduct() {
    for(let i = 0; i < 9; i++) {
        let contain = `<div class="product-layout product-grid col-lg-4 col-md-5 col-sm-6 col-xs-10">
                      <div class="product-thumb">
                        <div class="image product-imageblock">
                          <a href="product.html">
                              <div class="related-product-sale">
                                 <h5 style='margin-top: 10px'> -20%</h5>
                               </div>
             <img id="imgCategory" src="image/product/product-02.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /> </a>
                          <div class="button-group">
                            <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></button>
                            <button type="button" class="addtocart-btn">Mua ngay</button>
                            <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                          </div>
                        </div>
                        <div class="caption product-detail">
                       <h2 id="brandCategory" style='margin-top: 5px; text-transform: uppercase'>NIKE</h2>
                          <h4 class="product-name">
            <a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy" style='text-transform: capitalize'>
            Nike Air Force 1</a> </h4> 
                          <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to 40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go. Cover
                            Flow. Browse through your music collection by flipping..</p> 
                          <p id="priceCategory" class="price product-price"><span class="price-old" style='margin-right: 10px'> 2.000.000VND</span>1.500.000 VND </p>
                          <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>                                    </div>
                        </div>
                        <div class="button-group">
                          <button type="button" class="wishlist" data-toggle="tooltip" title="Thêm vào yêu thích"><i class="fas fa-heart"></i></button>
                          <button type="button" class="addtocart-btn">Mua ngay</button>
                          <button type="button" class="compare" data-toggle="tooltip" title="Thêm vào giỏ hàng"><i class="fas fa-shopping-cart"></i></button>
                        </div>
                      </div>
                    </div>`;
        $(".grid-list-wrapper").append(contain);
    }

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
    $(".pagination").append(`<li><a id="left-page">&lt;</a></li><li><a id="right-page">&gt;</a></li>`);
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

