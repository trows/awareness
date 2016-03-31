package com.awareness.trows.util.httpClient;

import java.util.Map;

/**
 * Created by Throws_exception on 2015/8/3.
 */
public class urlUtil {
    //构造带参数的URL
    public static String addParams(String uri, Map<String, String> params) {
        StringBuilder url = new StringBuilder();
        url.append(uri);
        url.append("?");

        if (params != null) {
            for (Map.Entry<String, String> entry : params.entrySet()) {
                url.append(entry.getKey());
                url.append("=");
                url.append(entry.getValue());
                url.append("&");
            }
        }

        return url.substring(0, url.length() - 1);
    }
}
