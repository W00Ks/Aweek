package cs.dto;

import java.util.Date;

public class Notice {

   private int noticeNo;
   private int fileNo;
   private String writerId;
   private String writerNick;
   private String noticeTitle;
   private String noticeContent;
   private Date noticeDate;
   private int noticeHit;
   
   public Notice() {}

   public Notice(int noticeNo, int fileNo, String writerId, String writerNick, String noticeTitle,
         String noticeContent, Date noticeDate, int noticeHit) {
      super();
      this.noticeNo = noticeNo;
      this.fileNo = fileNo;
      this.writerId = writerId;
      this.writerNick = writerNick;
      this.noticeTitle = noticeTitle;
      this.noticeContent = noticeContent;
      this.noticeDate = noticeDate;
      this.noticeHit = noticeHit;
   }

   @Override
   public String toString() {
      return "Notice [noticeNo=" + noticeNo + ", fileNo=" + fileNo + ", writerId=" + writerId + ", writerNick="
            + writerNick + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent + ", noticeDate="
            + noticeDate + ", noticeHit=" + noticeHit + "]";
   }

   public int getNoticeNo() {
      return noticeNo;
   }

   public void setNoticeNo(int noticeNo) {
      this.noticeNo = noticeNo;
   }

   public int getFileNo() {
      return fileNo;
   }

   public void setFileNo(int fileNo) {
      this.fileNo = fileNo;
   }

   public String getWriterId() {
      return writerId;
   }

   public void setWriterId(String writerId) {
      this.writerId = writerId;
   }

   public String getWriterNick() {
      return writerNick;
   }

   public void setWriterNick(String writerNick) {
      this.writerNick = writerNick;
   }

   public String getNoticeTitle() {
      return noticeTitle;
   }

   public void setNoticeTitle(String noticeTitle) {
      this.noticeTitle = noticeTitle;
   }

   public String getNoticeContent() {
      return noticeContent;
   }

   public void setNoticeContent(String noticeContent) {
      this.noticeContent = noticeContent;
   }

   public Date getNoticeDate() {
      return noticeDate;
   }

   public void setNoticeDate(Date noticeDate) {
      this.noticeDate = noticeDate;
   }

   public int getNoticeHit() {
      return noticeHit;
   }

   public void setNoticeHit(int noticeHit) {
      this.noticeHit = noticeHit;
   }
   
}