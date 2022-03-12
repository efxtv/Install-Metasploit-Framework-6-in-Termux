# How to install Metasploit Framework 6 in Termux 2022 uk2blogger


  
  

Step 1 Download termux and termux api from <a href="https://f-droid.org/en/" target="_blank">F-Droid</a>


Download and execute the script
<pre>pkg update; pkg upgrade
pkg install wget curl
cd $HOME;wget https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/metasploit-6-termux.sh -q;bash metasploit-6-termux.sh </pre>

<pre>rm -rf /data/data/com.termux/files/usr/bin/msfvenom

cd;cd metasploit-framework;ln -s $HOME/metasploit-framework/msfvenom /data/data/com.termux/files/usr/bin/
</pre>

<div class="row">
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux01.jpg" alt="Snow" style="width:100%">
  </div>
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux02.jpg" alt="Forest" style="width:100%">
  </div>
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux03.jpg" alt="Mountains" style="width:100%">
  </div>
</div>



<div class="row">
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux04.jpg" alt="Snow" style="width:100%">
  </div>
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux05.jpg" alt="Forest" style="width:100%">
  </div>
  <div class="column">
    <img src="https://raw.githubusercontent.com/efxtv/Metasploit-in-termux/main/Demo-Screenshots/Metasploit6-for-termux06.jpg" alt="Mountains" style="width:100%">
  </div>
</div>


