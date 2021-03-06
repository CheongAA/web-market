package com.mju.ict.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3URI;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Component
public class S3Util {

	@Value("#{aws['cloud.aws.s3.bucket']}")
	private String bucketName;

	@Value("#{aws['cloud.aws.credentials.accessKey']}")
	private String accessKey;

	@Value("#{aws['cloud.aws.credentials.secretKey']}")
	private String secretKey;

	@Value("#{aws['cloud.aws.region.static']}")
	private String region;

	private AmazonS3Client conn;

	public void init() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		this.conn = new AmazonS3Client(credentials, clientConfig);
		conn.setEndpoint("s3." + region + ".amazonaws.com"); // 엔드포인트 설정
	}

	// get BucketName
	public String getBucketName() {
		return bucketName;
	}

	// 버킷 리스트를 가져오는 메서드이다.
	public List<Bucket> getBucketList() {
		init();
		return conn.listBuckets();
	}

	// 버킷을 생성하는 메서드이다.
	public Bucket createBucket(String bucketName) {
		init();
		return conn.createBucket(bucketName);
	}

	// 폴더 생성 (폴더는 파일명 뒤에 "/"를 붙여야한다.)
	public void createFolder(String bucketName, String folderName) {
		init();
		conn.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}

	// 파일 업로드
	public void fileUpload(String bucketName, String fileName, byte[] fileData) throws FileNotFoundException {
		init();

		String filePath = (fileName).replace(File.separatorChar, '/'); // 파일 구별자를 `/`로 설정(\->/) 이게 기존에 / 였어도 넘어오면서 \로
																		// 바뀌는 거같다.
		ObjectMetadata metaData = new ObjectMetadata();

		metaData.setContentLength(fileData.length); // 메타데이터 설정 -->원래는 128kB까지 업로드 가능했으나 파일크기만큼 버퍼를 설정시켰다.
		ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData); // 파일 넣음

		conn.putObject(bucketName, filePath, byteArrayInputStream, metaData);

	}

	// 파일 삭제
	public void fileDelete(String fileName) {
		init();
		String imgName = (fileName).replace(File.separatorChar, '/');
		conn.deleteObject(new DeleteObjectRequest(bucketName,new AmazonS3URI(imgName).getKey()));
	}

	// 파일 URL
	public String getFileURL(String fileName) {
		init();
		System.out.println("넘어오는 파일명 : " + fileName);
		String imgName = (fileName).replace(File.separatorChar, '/');
		return conn.getResourceUrl(bucketName, imgName);
	}
	
	
	//s3 업로드 후 url 리턴
 	public String uploadS3Image(String uploadPath,MultipartFile file) {
		
		ResponseEntity<String> img_path = null;
		try {
			img_path = new ResponseEntity<String>(
					UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename()),
					HttpStatus.CREATED);
			fileUpload(bucketName, uploadPath + img_path.getBody(), file.getBytes());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return getFileURL(uploadPath+img_path.getBody());
	}

}