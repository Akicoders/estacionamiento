package pe.edu.utp.ftags.model;

import java.io.Serializable;

public class Book implements Serializable {
    private String title;
    private String author;
    private Float price;
    private Integer stock;
    private String img;

    public Book() {
    }

    public Book(String title, String author, Float price, Integer stock, String img) {
        this.title = title;
        this.author = author;
        this.price = price;
        this.stock = stock;
        this.img = img;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String checkSeverityStock(){
        if (stock > 0){
            return "success"; // para <p:tag>
        }else{
            return "danger";
        }
    }

    public String stockInText(){
        String msg = "%d in stock";
        return String.format(msg,stock);
    }
}
