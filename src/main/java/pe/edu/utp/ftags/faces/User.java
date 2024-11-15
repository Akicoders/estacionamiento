package pe.edu.utp.ftags.faces;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;

@ManagedBean
@SessionScoped
public class User implements Serializable {
    private String email;
    private String password;
    private String name;
    private String fullname;
    private Integer followers;
    private Integer books;
    private Integer comments;
    private String img;

    public User() {
        resetValues();
    }

    public void resetValues(){
        // Datos de prueba
        this.email = "";
        this.password = "";
        name = "Alice";
        fullname = "Alice Deza Montoya";
        followers = 150;
        books = 3;
        comments = 10;
        img = "alice.png";
    }

    public User(String email, String password, String name, String fullname, Integer followers, Integer books, Integer comments, String img) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.fullname = fullname;
        this.followers = followers;
        this.books = books;
        this.comments = comments;
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Integer getFollowers() {
        return followers;
    }

    public void setFollowers(Integer followers) {
        this.followers = followers;
    }

    public Integer getBooks() {
        return books;
    }

    public void setBooks(Integer books) {
        this.books = books;
    }

    public Integer getComments() {
        return comments;
    }

    public void setComments(Integer comments) {
        this.comments = comments;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String isValidUser(){
        // Validacion de prueba
        boolean valid_user = (email.equals("alice@gmail.com")) ? true: false;
        if (valid_user) {
            return "dash?faces-redirect=true";
        }else{
            return "login?faces-redirect=true";
        }
    }

    public String logout(){
        resetValues();
        return "login?faces-redirect=true";
    }

}
