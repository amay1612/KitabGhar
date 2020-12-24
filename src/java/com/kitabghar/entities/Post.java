package com.kitabghar.entities;

public class Post {

    private int pid;
    private String bookName;
    private String contact;
    private int bookPrice;
    private String bookPic;
    private String address;
    private String author;
    private int catId;
    private int userId;

    public Post() {
    }

    public Post(int pid, String bookName, String contact, int bookPrice, String bookPic, String address,String author, int catId,int userId) {
        this.pid = pid;
        this.bookName = bookName;
        this.contact = contact;
        this.bookPrice = bookPrice;
        this.bookPic = bookPic;
        this.address = address;
        this.author=author;
        this.catId = catId;
        this.userId=userId;
    }

    public Post(String bookName, String contact, int bookPrice, String bookPic, String address,String author, int catId,int userId) {
        this.bookName = bookName;
        this.contact = contact;
        this.bookPrice = bookPrice;
        this.bookPic = bookPic;
        this.address = address;
        this.author=author;
        this.catId = catId;
        this.userId=userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(int bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookPic() {
        return bookPic;
    }

    public void setBookPic(String bookPic) {
        this.bookPic = bookPic;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
