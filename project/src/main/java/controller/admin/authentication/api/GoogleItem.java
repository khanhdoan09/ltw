package controller.admin.authentication.api;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class GoogleItem {

    public static String getToken(final String code, String token, String id, String client, String uri, String type) throws ClientProtocolException, IOException {
        String response = Request.Post(token)
                .bodyForm(Form.form().add("client_id", id)
                        .add("client_secret", client)
                        .add("redirect_uri", uri).add("code", code)
                        .add("grant_type", type).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }
    public static GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = ConstantsSignIn.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GooglePojo googlePojo = new Gson().fromJson(response, GooglePojo.class);
        System.out.println(googlePojo);
        return googlePojo;
    }
}
