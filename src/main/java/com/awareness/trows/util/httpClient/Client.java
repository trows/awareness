package com.awareness.trows.util.httpClient;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.client.LaxRedirectStrategy;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Throws_exception on 2015/7/15.
 */
public class Client {
    private CloseableHttpClient HttpClient = null;
    private String AGENT = "Mozilla/5.0(Linux;U;Android 2.2.1;en-us;Nexus One Build.FRG83)"
            + "AppleWebKit/553.1(KHTML,like Gecko) Version/4.0 Mobile Safari/533.1";
    private int MaxTotal = 200;
    private int MaxPerRoute = 20;
    private int RequestTimeout = 3000;
    private int SocketTimeout = 3000;

    //私有化构造方法
    private Client() {
        initHttpClient();
    }

    //初始化client
    private void initHttpClient() {
        PoolingHttpClientConnectionManager httpClientConnectionManager = new PoolingHttpClientConnectionManager();
        httpClientConnectionManager.setMaxTotal(MaxTotal);   //设置连接线程最大数量
        httpClientConnectionManager.setDefaultMaxPerRoute(MaxPerRoute); //设置单个路由最大连接数量

        RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(RequestTimeout)
                .setSocketTimeout(SocketTimeout).build();
        LaxRedirectStrategy laxRedirectStrategy = new LaxRedirectStrategy();

        HttpClient = HttpClients.custom().setConnectionManager(httpClientConnectionManager).setDefaultRequestConfig(requestConfig).
                setUserAgent(AGENT).setRedirectStrategy(laxRedirectStrategy).build();
    }

    //自建client
    private static final Client client = new Client();

    //向外暴露实体
    public static Client getSingletonClient() {
        return client;
    }

    //使用Get方式发送请求
    public String clientGet(String url) {
        String result = "";
        if (null == url || "".equals(url)) {
            return result;
        }
        HttpGet httpGet = new HttpGet(url);
        CloseableHttpResponse response = null;

        try {
            response = HttpClient.execute(httpGet);

            HttpEntity entity = response.getEntity();

            if (entity != null) {
                int statuCode = response.getStatusLine().getStatusCode();
                if (statuCode == 200) {
                    result = EntityUtils.toString(entity,"UTF-8");
                    EntityUtils.consume(entity);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (null != response) {
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }


    //使用post方法发送请求
    public String clientPost(String url, Map<String, String> params) {
        String result = "";
        if (null == url || "".equals(url)) {
            return result;
        }
        List<NameValuePair> paramList = new ArrayList<NameValuePair>();
        HttpPost httpPost = new HttpPost(url);
        if (params!=null){
            //获取参数
            for (Map.Entry<String, String> entry : params.entrySet()) {
                paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
            }
        }

        UrlEncodedFormEntity uefEntity;
        CloseableHttpResponse response = null;
        try {
            uefEntity = new UrlEncodedFormEntity(paramList, "UTF-8");
            httpPost.setEntity(uefEntity);

            response = HttpClient.execute(httpPost);

            HttpEntity entity = response.getEntity();

            if (null != entity) {
                int statuCode = response.getStatusLine().getStatusCode();
                if (statuCode == 200) {
                    result = EntityUtils.toString(entity,"UTF-8");
                    EntityUtils.consume(entity);
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (null != response) {
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }


        return result;
    }

}
