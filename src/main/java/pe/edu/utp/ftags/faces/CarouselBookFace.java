package pe.edu.utp.ftags.faces;
import pe.edu.utp.ftags.model.Book;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.util.ArrayList;
import java.util.List;

@ManagedBean
@SessionScoped
public class CarouselBookFace {
    private List<Book> bookList;

    public CarouselBookFace() {
        initBooksList();
    }

    public void initBooksList(){
        bookList = new ArrayList<>(List.of(
                new Book("Programming in Java","Alice",85.5f,100,"java.jpg"),
                new Book("Programming in Python","Alice",55.5f,40,"python.jpg"),
                new Book("Programming in C++","Alice",90.0f,0,"cpp.png"),
                new Book("HTML5 in action","Alice",85.5f,100,"html.jpg"),
                new Book("CSS simple","Alice",55.5f,40,"css.jpg"),
                new Book("Javascript for you","Alice",90.0f,80,"js.jpg")
        ));

    }

    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }
}
