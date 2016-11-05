/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.codejava.spring.model;

import java.util.Date;

/**
 *
 * @author khai
 */
public class Post {
    public int id;
    public Date postedAt;

    public String content;

    public int author_id;

    public Post(int id, Date postedAt, String content, int author_id) {
        this.id = id;
        this.postedAt = postedAt;
        this.content = content;
        this.author_id = author_id;
    }

    public int getId() {
        return id;
    }

    public Date getPostedAt() {
        return postedAt;
    }

    public String getContent() {
        return content;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public Post() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public void autoSetPostedAt() {
        this.postedAt = new Date();
    }

    public void setPostedAt(Date postedAt) {
        this.postedAt = postedAt;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

   
}