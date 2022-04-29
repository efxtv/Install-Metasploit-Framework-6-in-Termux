# Install Metasploit In Termux Without Error 2022 uk2blogger
 
<b>Step 1</b> Download or update Termux and Termux API from <a href="https://youtu.be/j7PCscyOxgM" target="_blank">F-Droid</a>

<b>Step 2</b> Copy paste the script in your termux. Update upgrade not required

To Install Metasploit  In Termux Without Error this time you do not have to refresh your termux. Just copy paste the command and wait for it.

<pre> source <(curl -fsSl https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/metasploit-6-termux.sh) </pre>

<img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/metasploit-6.1.41.png" alt="Metasploit in termux- Metasploit benner v6.1.41-dev" style="width:100%"><br><br>
<img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/metasploit-6.1.40.jpg" alt="Metasploit in termux- Metasploit benner v6.1.40-dev" style="width:100%"><br><br>
<img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/metasploit-in-termux-6.1.39.png" alt="Metasploit in termux- Metasploit benner v6.1.39-dev" style="width:100%"><br><br>
<img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/photo_2022-04-10_09-39-39.jpg" alt="Metasploit in termux- Metasploit benner v6.1.40-dev-c252faf" style="width:100%">
  
  
# For older versions read below.... 
Step 1 Download termux and termux api from <a href="https://f-droid.org/en/" target="_blank">F-Droid</a>


Download and execute the script
<pre>pkg update; pkg upgrade
pkg install wget curl
cd $HOME;wget https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/metasploit-6-termux.sh -q;bash metasploit-6-termux.sh </pre>

<pre>rm -rf /data/data/com.termux/files/usr/bin/msfvenom

cd;cd metasploit-framework;ln -s $HOME/metasploit-framework/msfvenom /data/data/com.termux/files/usr/bin/
</pre>

# unsupported (OpenSSL::Cipher::CiPherError)
After installing the Metasploit-Framework 6 in termux copy paste the everything in the home directory
<pre>
cd metasploit-framework;
sed -i '13,15 {s/^/#/}' /data/data/com.termux/files/usr/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/encryption_algorithm/functionable.rb; sed -i '14 {s/^/#/}' /data/data/com.termux/files/usr/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/server_host_key_algorithm/ecdsa_sha2_nistp256.rb; sed -i '14 {s/^/#/}' /data/data/com.termux/files/usr/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/server_host_key_algorithm/ecdsa_sha2_nistp384.rb; sed -i '14 {s/^/#/}' /data/data/com.termux/files/usr/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/server_host_key_algorithm/ecdsa_sha2_nistp521.rb;
clear;echo "Done...."
</pre>
<div class="row">
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux01.jpg" alt="Metasploit in termux- Metasploit benner" style="width:100%">
  </div>
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux02.jpg" alt="Metasploit in termux- Metasploit benner" style="width:100%">
  </div>
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux03.jpg" alt="Metasploit in termux- Metasploit benner" style="width:100%">
  </div>
</div>



<div class="row">
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux04.jpg" alt="Metasploit in termux- Metasploit benner" style="width:100%">
  </div>
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux05.jpg" alt="Metasploit in termux- Metasploit benner" style="width:100%">
  </div>
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux06.jpg" alt="Metasploit in termux- Metasploit benner" style="width:100%">
  </div>
</div>


