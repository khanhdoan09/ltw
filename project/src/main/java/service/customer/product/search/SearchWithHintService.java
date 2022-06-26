package service.customer.product.search;

import beans.ProductHint;
import com.google.gson.Gson;
import dao.product.search.DaoSearchWithHint;
import java.util.List;

public class SearchWithHintService {

    public String getData(String wordSearchHeader) {
        List<ProductHint> words = DaoSearchWithHint.getInstance().getDataFromWordInSearchHeader(wordSearchHeader);
        if (words != null) {
            String convertToJson = new Gson().toJson(words);
            return convertToJson;
        }
        return "";
    }
}
