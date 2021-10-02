function searchPopular() {
    $(".input-text-search-top").click(()=>{
        $(".contain-search-popular").css("display", "flex");
    });
    $(".contain-search-popular").mouseleave(()=>{
        $(".contain-search-popular").css("display", "none");
    });
}

$(window).ready(searchPopular);