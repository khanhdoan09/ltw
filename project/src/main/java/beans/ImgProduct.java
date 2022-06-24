package beans;

import java.util.List;

public class ImgProduct {
    private List<String> mainImg;
    private List<String> subImg;


    public ImgProduct(List<String> mainImg, List<String> subImg) {
        this.mainImg = mainImg;
        this.subImg = subImg;
    }

    public List<String> getMain() {
        return mainImg;
    }

    public List<String> getSub() {
        return subImg;
    }
}
