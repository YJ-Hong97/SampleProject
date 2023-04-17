package com.sample.myapp;

import java.io.ByteArrayInputStream;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
@Service
public class S3Service {
	final private AmazonS3 s3Client;

	  String bucketName = "sampleprojectbucket";
	  String accessKey = "AKIASKTUWB3RCNR6CVX3";
	  String secretKey = "Br1qfJ+6W7Fejj1MvglVnws5x4oaplb43G1y3kKK";

	  public S3Service() {
	    AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);

	    this.s3Client = AmazonS3ClientBuilder.standard()
	                        .withCredentials(new AWSStaticCredentialsProvider(credentials))
	                        .withRegion(Regions.AP_NORTHEAST_2)
	                        .build();
	  }

	  // upload original image file
	  public String uploadFile(MultipartFile image, String s3Path) {
	    try {
	    	String url = s3Path+"/"+image.getOriginalFilename();
	      // set ObjectMatadata
	      byte[] bytes = IOUtils.toByteArray(image.getInputStream());

	      ObjectMetadata objectMetadata = new ObjectMetadata();
	      objectMetadata.setContentLength(bytes.length);
	      objectMetadata.setContentType(image.getContentType());

	      // save in S3
	      ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
	      this.s3Client.putObject(this.bucketName, url, byteArrayInputStream, objectMetadata);
		  
	      byteArrayInputStream.close();
	      return this.s3Client.getUrl(this.bucketName, url).toString();
	      
	      }catch(Exception e){
	    	  return null;
	      }
	    }

	   public void deleteFile(String url) {
		  s3Client.deleteObject(bucketName,url);
	   }
	
}