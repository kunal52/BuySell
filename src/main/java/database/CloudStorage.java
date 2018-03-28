package database;



import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

public class CloudStorage {
 
	
	public static void uploadImageToServer(String file,InputStream content)
	{
	  Storage storage;
	try {
		storage = StorageOptions.newBuilder()
				    .setCredentials(ServiceAccountCredentials.fromStream(new FileInputStream("/home/bitnami/gcp/cloudkey.json")))
				    .build()
				    .getService();
		
	  Bucket bucket=storage.get("fir-cloud-7e07e.appspot.com");
	  bucket.create("productImage/"+file+".jpg",content, "image/jpeg ");
	  
	  
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	  
  }
  
