# File Integrity Monitor - A PowerShell Project


<h2>Description</h2>
In this portfolio project, I have created a File Integrity Monitor using PowerShell scripts to monitor and safeguard the integrity of files within a designated folder. The primary goal of this project is to ensure the security and trustworthiness of the files present in the folder. To achieve this, the program utilizes cryptographic hashing to generate unique fingerprints for each file's content. Whenever any changes, new files, or deletions are detected within the monitored folder, the user is immediately notified.


<h2>Utilities Used</h2>

- <b>Powershell</b> 
- <b>Hashing Algorithms</b>
- <b>MD5 (Message Digest Algorithm 5)</b>
- <b>SHA-1 (Secure Hash Algorithm 1)</b>
- <b>SHA-256 (Secure Hash Algorithm 256)</b>
- <b>SHA-512 (Secure Hash Algorithm 512)</b>

<h2>Project walk-through:</h2>
<p align="left">

<h3>Hashing</h3>

In the designated folder named "files," you will find several files, each containing a unique sequence of random letters. The contents of these files are distinct from one another, ensuring that no two files share the same combination of letters.
<br />
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/232623e666c088faf9462ae2aa2f73670edff3ab/nochange123.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />
In this project, the PowerShell script calculates and stores the hashes of all the files within the "files" folder using the SHA-256 hashing algorithm. This hash acts as a digital fingerprint, ensuring that even minor alterations to a file will result in a completely different hash. To calculate the hashes of the files, I implemented a function called "calculate-file-hash," leveraging the intrinsic PowerShell command "Get-FileHash." This function efficiently computes the SHA-256 hashes for each file, ensuring data integrity and enhancing security within the project. The resulting hash values are saved in a file called "baseline.txt" in a specific format.

Moreover, to enhance accessibility and streamline operations, a dictionary data structure is utilized. This dictionary contains the file paths as keys and their corresponding SHA-256 hashes as values. This approach simplifies the retrieval of file hashes and facilitates quick lookups when comparing the current state of files with the baseline values.

<h3>Monitoring</h3>

To ensure the files' hash values remain unchanged over time, I implement a continuous monitoring mechanism. The process involves calculating the hashes of all files in the targeted folder every 10 seconds using PowerShell's "Start-Sleep" command for efficient timing. These calculated hashes serve as the keys, which I then use to compare against the previously stored values in the dictionary.

<br />
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/8126c957742c5b2c5c5eec75396dd761fd7c3056/script.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />

By continuously comparing the latest hash values with their corresponding baseline entries in the dictionary, I can promptly detect any alterations or modifications to the files. This approach allows me to maintain the integrity and security of the files within the folder and ensures that any discrepancies are promptly identified and addressed.

The File Integrity Monitor has three key monitoring functionalities,<br /><br />
<b>Change Detection</b>
<br /> 
The program periodically calculates and compares the file hashes with their previously recorded values. If any modifications are made to the files, the program quickly identifies the changes by detecting differences in the hash values. When a file's hash differs from its previous value, the program generates an alert to notify the user about the detected change. This proactive approach helps users respond promptly to any unauthorized alterations or data tampering.
<br />
<br />
<br />
The content in the file "d.txt" before editing.
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/de35fe0025e8ca26173a321b9f7116add473b45f/textnochange.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />
<br />
<br />
The output of the monitor.
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/873207275d29be02010f65ddcc68d88ff74edddc/nochange.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />
<br />
<br />
The content in the file "d.txt" after editing.
<br />
<br />
<br />
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/d44a212d8a301f37fa45189bab214bf0c77b903b/textxhange.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />
<br />
<br />
The output of the monitor.
<br />
<br />
<br />
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/1bf9ed487286ebbcbee4ae69949738d46705e271/change.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />
<b>New File Monitoring</b>
<br />
The File Integrity Monitor is equipped to handle new files added to the monitored folder. Whenever a new file is detected, the program captures its details and generates a corresponding hash. The file's path and its hash value are then added to a comprehensive list of monitored files stored in the dictionary. This enables the program to maintain an up-to-date record of all files and ensures that new additions are included in the monitoring process.
<br />
<br />
<br />
<br />
An new file "d-copy.txt" is created.
<br />
<br />
<br />
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/a3f89e9d508d61aca4369c5a27062c95eadd2bc4/create1.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />
<br />
<br />
The output of the monitor.
<br />
<br />
<br />
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/c4fd8d84b5df3d57a445b959034d45e38b452bfb/newcreated.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />
<b>File Deletion Tracking</b>
<br />
The program continuously tracks the presence of files within the designated folder. If a file is deleted, the File Integrity Monitor promptly identifies the absence by detecting the missing file path in the folder. The program then raises a notification to alert the user about the deleted file. This feature helps users stay informed about any unexpected deletions and aids in identifying potential security issues or unintentional data loss.
<br />
<br />
<br />
The file "d.txt" is deleted.
<br />
<br />
<br />
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/070b4a5b28b117712d4d1f45895ca295c18483a6/delete1.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />
<br />
<br />
The output of the monitor.
<br />
<br />
<br />
<br />
<img src="https://github.com/sdkallullathil/Powershell_project/blob/c823beecaad8b5ba6ff85db4c5147d4c414acec2/delete.png" height="90%" width="90%" alt="Disk Sanitization Steps"/>
<br />
<br />
<br />
<br />

<h3>Conclusion</h3>

By developing this File Integrity Monitor using PowerShell, I aimed to provide a reliable and straightforward solution for maintaining data integrity in a specific folder. It offers comprehensive monitoring capabilities, ensuring the integrity and security of the files within the designated folder. It provides real-time alerts and tracking for changes, additions, and deletions, enabling users to take immediate action when necessary.Users can rest assured that any changes to files within the monitored folder will be promptly detected and reported, helping them respond quickly to potential security threats or unintended modifications. 


