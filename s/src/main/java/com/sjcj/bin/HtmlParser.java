package com.sjcj.bin;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.sjcj.model.Url;
import com.sjcj.service.UrlManager;
import com.sjcj.service.UrlpatternManager;
 
public class HtmlParser {
    /**
     * Ҫ��������ҳ
     */
    String htmlUrl;
 
    /**
     * �������
     */
    ArrayList<String> hrefList = new ArrayList();
 
    /**
     * ��ҳ���뷽ʽ
     */ 
    String charSet;
    /**
     * ��ȡmanager
     */
    static ApplicationContext context = new ClassPathXmlApplicationContext("spring/applicationContext.xml");  	
    static UrlManager urlManager = (UrlManager) context.getBean("urlManager");
    static UrlpatternManager urlPatternManager = (UrlpatternManager) context.getBean("urlPatternManager");
    public HtmlParser(String htmlUrl) {
        // TODO �Զ����ɵĹ��캯�����
        this.htmlUrl = htmlUrl;
    }
 
    /**
     * ��ȡ�������
     * 
     * @throws IOException
     */
    public ArrayList<String> getHrefList() throws IOException {
 
        parser();
        return hrefList;
    }
 
    /**
     * ������ҳ����
     * 
     * @return
     * @throws IOException
     */
    private void parser() throws IOException {
        URL url = new URL(htmlUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setDoOutput(true);
 
        String contenttype = connection.getContentType();
        charSet = getCharset(contenttype);
 
        InputStreamReader isr = new InputStreamReader(
                connection.getInputStream(), charSet);
        BufferedReader br = new BufferedReader(isr);
 
        String str = null, rs = null;
        while ((str = br.readLine()) != null) {
            rs = getHref(str);
 
            if (rs != null)
                hrefList.add(rs);
        }
 
    }
 
    /**
     * ��ȡ��ҳ���뷽ʽ
     * 
     * @param str
     */
    private String getCharset(String str) {
        Pattern pattern = Pattern.compile("charset=.*");
        Matcher matcher = pattern.matcher(str);
        if (matcher.find())
            return matcher.group(0).split("charset=")[1];
        return null;
    }
 
    /**
     * ��һ���ַ����ж�ȡ����
     * 
     * @return
     */
    private String getHref(String str) {
    	String patt = urlPatternManager.get(1l).getPattern();
        //urlPatternManager.getAll().size();
    	Pattern pattern = Pattern.compile(patt);
        Matcher matcher = pattern.matcher(str);
        if (matcher.find())
            return matcher.group(0);
        return null;
    }
 
    public static void main(String[] arg) throws IOException {

    	 
        HtmlParser a = new HtmlParser("http://163.com/");
        ArrayList<String> hrefList = a.getHrefList();
        for (int i = 0; i < hrefList.size(); i++){
        	Url url = new Url();
        	url.setPath(hrefList.get(i));
        	urlManager.saveUrl(url);
        	if(!url.getPath().contains("javascript")){
        		System.out.println(url.getPath().replaceAll("<a href=","" ).replaceAll("</a>", "").replace(">", "").replaceAll("\\p{InCJK Unified Ideographs}+", ""));
        	}
        
        	
        	
        }
        
        
        
        
           // System.out.println();
    }
 
}