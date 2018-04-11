package com.film.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.struts2.ServletActionContext;

import com.film.bean.AccountBean;
import com.film.bean.UserOrderBean;
import com.film.biz.AdminManager;
import com.film.entity.FilmEntity;
import com.film.entity.PayOrderEntity;
import com.film.entity.UserEntity;
import com.film.util.MSUtil;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 16 * 1024 ;
	private File myfile;
	private String myfileFileName;
	private FilmEntity film;
	private String page;
	private String type;
	private String money;
	private String password;
	private String activity;
	private String filmname;
	private String userid;
	private String filmid;
	private String price;
	private String placeroomid;
	private String date;
	private String begintime;
	private String placeid;
    public FilmEntity getFilm() {
		return film;
	}
	public void setFilm(FilmEntity film) {
		this.film = film;
	}
	public File getMyfile() {
		return myfile;
	}
	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}
	public String getMyfileFileName() {
		return myfileFileName;
	}
	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}
	public String getPlaceid() {
		return placeid;
	}
	public void setPlaceid(String placeid) {
		this.placeid = placeid;
	}
	public String getPlaceroomid() {
		return placeroomid;
	}
	public void setPlaceroomid(String placeroomid) {
		this.placeroomid = placeroomid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFilmid() {
		return filmid;
	}
	public void setFilmid(String filmid) {
		this.filmid = filmid;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getFilmname() {
		return filmname;
	}
	public void setFilmname(String filmname) {
		this.filmname = filmname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		AccountBean account = (AccountBean)session.getAttribute("account");
		if(account==null||"0".equals(account.getAdmin())){
			JOptionPane.showMessageDialog(null, "不是管理员", "提示", 0, null);
			super.addFieldError("error", "不是管理员");
		}
	}
	public String addFilm(){
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		System.out.println(myfileFileName);
		File imageFile = new File(ServletActionContext.getServletContext().getRealPath("/resource/movies" ) + "/" +uuid+myfileFileName.substring(myfileFileName.lastIndexOf(".")));
		copy(myfile, imageFile);
		boolean flag = new AdminManager().addFilm(film, uuid+myfileFileName.substring(myfileFileName.lastIndexOf(".")));
		if(flag){
			JOptionPane.showMessageDialog(null, "添加成功", "提示", 0, null);
		}else{
			JOptionPane.showMessageDialog(null, "添加失败", "提示", 0, null);
		}
		return "film";
	}
	private static void copy(File src, File dst) {
		try {
		InputStream in = null ;//输入流
		OutputStream out = null ;//输出流
		try {
		in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
		out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
		byte [] buffer = new byte [BUFFER_SIZE];
		while (in.read(buffer) > 0 ) {
		out.write(buffer);
		}
		} finally {
		if ( null != in) {
		in.close();
		}
		if ( null != out) {
		out.close();
		}
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		}
	public String deletePlace(){
		HttpServletRequest request=ServletActionContext.getRequest();
		new AdminManager().deleteSeat(placeid);
		new AdminManager().deletePlace(placeid);
		request.setAttribute("placeroom", new AdminManager().placeroom().iterator());
		request.setAttribute("placerooms", new AdminManager().placeroom().iterator());
		request.setAttribute("film", new AdminManager().film().iterator());
		return "place";
	}
	public String findPlace(){
		HttpServletRequest request=ServletActionContext.getRequest();
		date = date.substring(0,date.indexOf("T"));
		request.setAttribute("place", new AdminManager().findPlace(placeroomid, date).listIterator());
		request.setAttribute("placerooms", new AdminManager().placeroom().iterator());
		request.setAttribute("placeroom", new AdminManager().placeroom().iterator());
		request.setAttribute("film", new AdminManager().film().iterator());
		return "place";
	}
	public String addPlace(){
		HttpServletRequest request=ServletActionContext.getRequest();
		date = date.substring(0,date.indexOf("T"));
		begintime = begintime.substring(begintime.indexOf("T")+1,begintime.indexOf("+"));
		Number number = new AdminManager().addPlace(placeroomid, filmid, date, begintime);
		if(number!=null){
			int num = number.intValue();
			if(num==1){
				JOptionPane.showMessageDialog(null, "添加成功", "提示", 0, null);
			}else{
				JOptionPane.showMessageDialog(null, "添加失败", "提示", 0, null);
			}
		}else{
			JOptionPane.showMessageDialog(null, "添加失败", "提示", 0, null);
		}
		request.setAttribute("placeroom", new AdminManager().placeroom().iterator());
		request.setAttribute("placerooms", new AdminManager().placeroom().iterator());
		request.setAttribute("film", new AdminManager().film().iterator());
		return "place";
	}
	public String loadPlace(){
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("placeroom", new AdminManager().placeroom().iterator());
		request.setAttribute("placerooms", new AdminManager().placeroom().iterator());
		request.setAttribute("film", new AdminManager().film().iterator());
		return "place";
	}
	private void userOrderPage(String page){
    	HttpServletRequest request=ServletActionContext.getRequest();
    	List<UserOrderBean> order = new AdminManager().userOrder(page.equals("0")?0:(Integer.parseInt(page))*20+1);
    	request.setAttribute("order", order);
    	request.setAttribute("page", Integer.parseInt(page));
	}
	private void userPayOrderPage(String page){
    	HttpServletRequest request=ServletActionContext.getRequest();
    	List<PayOrderEntity> order = new AdminManager().userPayOrder(page.equals("0")?0:(Integer.parseInt(page))*20+1);
    	request.setAttribute("order", order);
    	request.setAttribute("page", Integer.parseInt(page));
	}
	private void compositePage(){
    	HttpServletRequest request=ServletActionContext.getRequest();
    	if(type.equals("0")){
    		List<FilmEntity> list = new AdminManager().film();
    		request.setAttribute("title", new MSUtil(Integer.parseInt(type)).getFilmtitle());
    		request.setAttribute("url", "");
    		request.setAttribute("film", list.iterator());
    		request.setAttribute("type", type);
    	}
       if(type.equals("1")){
    	    List<UserEntity> list = new AdminManager().user();
    		request.setAttribute("title",new MSUtil(Integer.parseInt(type)).getUsertitle());
    		request.setAttribute("url", "");
    		request.setAttribute("user", list.iterator());
    		request.setAttribute("type", type);
    	}
	}
	public String nextPageOrder(){
    	page = String.valueOf(Integer.parseInt(page)+1);
    	userOrderPage(page);
		return "order";
	}
	public String previousPageOrder(){
    	page = String.valueOf(Integer.parseInt(page)-1);
    	userOrderPage(page);
		return "order";
	}
	public String nextPagePayOrder(){
    	page = String.valueOf(Integer.parseInt(page)+1);
    	userPayOrderPage(page);
		return "pay";
	} 
	public String previousPagePayOrder(){
    	page = String.valueOf(Integer.parseInt(page)-1);
    	userPayOrderPage(page);
		return "pay";
	}

	public String userOrder(){
		userOrderPage("0");
    	return "order";
    }
	
	public String userPayOrder(){
		userPayOrderPage("0");
		return "pay";
	}
	public String composite(){
		compositePage();
		return "composite";
	}
	public String user(){
		new AdminManager().updateUser(password, money, activity, userid);
		compositePage();
		return "composite";
	}
	public String film(){
		new AdminManager().updateFilm(price, activity, filmid);
		compositePage();
		return "composite";
	}
    @Override
    public String execute() throws Exception {
    	// TODO Auto-generated method stub
    	return SUCCESS;
    }
}
