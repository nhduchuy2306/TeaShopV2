/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea.blognew;

/**
 *
 * @author Huy
 */
public class BlogNewDTO {
    private String blogNewID;
    private String title;
    private String content;
    private String blogImg;

    public BlogNewDTO() {
    }

    public BlogNewDTO(String blogNewID, String title, String content) {
        this.blogNewID = blogNewID;
        this.title = title;
        this.content = content;
    }

    public BlogNewDTO(String blogNewID, String title, String content, String blogImg) {
        this.blogNewID = blogNewID;
        this.title = title;
        this.content = content;
        this.blogImg = blogImg;
    }

    public String getBlogNewID() {
        return blogNewID;
    }

    public void setBlogNewID(String blogNewID) {
        this.blogNewID = blogNewID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getBlogImg() {
        return blogImg;
    }

    public void setBlogImg(String blogImg) {
        this.blogImg = blogImg;
    }

    @Override
    public String toString() {
        return "BlogNew{" + "blogNewID=" + blogNewID + ", title=" + title + ", content=" + content + ", blogImg=" + blogImg + '}';
    }

    
    
    
}
