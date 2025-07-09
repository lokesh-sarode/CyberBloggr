-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Oct 21, 2023 at 10:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cyberbloggr`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phoneno`, `msg`, `date`) VALUES
(1, 'abc', 'abc@abc.com', '+919999999999', 'Test msg', '2023-05-21 04:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `author` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(30) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `slug`, `title`, `tagline`, `author`, `content`, `img_file`, `date`) VALUES
(1, 'first-post', 'What is Cyber security?', 'CyberBloggr\'s 1st post', 'Admin', 'Cybersecurity is the practice of protecting networks, devices and data from damage, loss or unauthorized access. Just as physical security protects buildings and the people in them from various physical threats, cybersecurity safeguards digital technologies and their users from digital dangers.', 'first-post.jpg', '2023-05-23 01:48:53'),
(2, 'second-post', 'Why is cybersecurity important?', 'CyberBloggr\'s 2nd post', 'Admin', 'Cybersecurity is vital because digital assets are valuable and vulnerable. With so much of daily life online, from bank account access to names and addresses, cybercrime can make lots of money and cause untold damage.\r\n\r\nCybersecurity is also important because of how common cybercrime is. In 2019, 32% of businesses identified cyberattacks or other security breaches and that doesn’t account for those who were infiltrated without realizing it. That figure has also only increased.\r\n\r\nBig corporations with lots of valuable data aren’t the only targets, either. Security breaches happen to small businesses, too and even to random individuals. Cybersecurity is so important because everyone could be a victim.', 'second-post.jpeg', '2023-05-23 02:21:41'),
(3, 'third-post', 'Top 5 cybersecurity threats to manage', 'Just as there are many types of cybersecurity, there are multiple cybersecurity threats. Here’s a look at some of the most common and dangerous ones facing businesses and individuals today.', 'Admin', '1. Malware\r\n \r\nMalware is one of the most common types of cybersecurity threats, despite a steady decline over the past few years. It’s short for “malicious software” and is a broad category covering programs and lines of code that cause damage or provide unauthorized access.\r\n\r\nViruses, trojans, spyware and ransomware are all types of malware. These can be as insignificant as placing unwanted pop-ups on a computer or as dangerous as stealing sensitive files and sending them somewhere else.\r\n\r\n\r\n2. Phishing\r\n\r\nWhile malware relies on technical factors to cause damage, phishing targets human vulnerabilities. These attacks involve tricking someone into giving away sensitive information or clicking on something that will install malware on their device. They’re often the starting point for a larger, more damaging attack.\r\n\r\nPhishing often comes in the form of emails in which cybercriminals pose as authority figures or have enticing news. These messages often appeal to people’s fears or desires to get them to act quickly without thinking. For example, many say the users are prize-winners or in trouble with the law.\r\n\r\n\r\n3. Insider threats\r\n\r\nWhile most cybersecurity threats come from outside an organization, some of the most dangerous come from within. Insider threats happen when someone with authorized access, like an employee, threatens a system, intentionally or not.\r\n\r\nMany insider threats are non-malicious. This happens when an authorized user becomes a phishing victim or accidentally posts on the wrong account, unintentionally endangering a system. Others may act on purpose, like a disgruntled ex-employee taking revenge on their former employer by installing malware on their computers.\r\n\r\n\r\n4. Man-in-the-middle attacks\r\n\r\nMan-in-the-middle (MITM) attacks are a form of eavesdropping, where cybercriminals will intercept data as it travels between points. Instead of stealing this information in the traditional sense, they copy it so it reaches its intended destination. Consequently, it may look like nothing took place at all.\r\n\r\nMITM attacks can happen through malware, fake websites and even compromised Wi-Fi networks. While they may not be as common as others, they’re dangerous because they’re hard to detect. A user could enter personal information into a hijacked website form and not realize it until it’s too late.\r\n\r\n\r\n5. Botnets\r\n\r\nBotnets are another common type of cybersecurity threat. These are networks of multiple infected computers, letting one threat actor attack using many devices at once. This often takes the form of distributed denial-of-service (DDoS) attacks, where attackers crash a system by overloading it with requests.\r\n\r\nBotnet attacks have seen a massive jump recently. In June 2021, 51% of organizations had detected botnet activity on their networks, up from 35% just six months earlier. Large-scale DDoS attacks can also cause massive damage, shutting down critical systems for hours or even days.', 'third-post.jpg', '2023-05-23 02:58:56'),
(4, 'fourth-post', 'Top 10 best practices for cybersecurity in 2023', 'Cybercrime isn’t just a broad category, but a growing one. These threats cost the world $6 trillion in 2021 and experts say that figure will rise by 15% annually for the next five years.\r\n\r\nAmid these rising threats, cybersecurity best practices become all the more important. Here are 10 of the best cybersecurity practices for businesses, employees and consumers.', 'Admin', '1. Use anti-malware software\r\nOne of the most important cybersecurity best practices is to install anti-malware software. The market is full of antivirus programs and services that can help people with any budget. Best of all, these programs automate malware detection and prevention, so you don’t have to be an expert to stay safe.\r\nMany cybersecurity threats start as malware, so this software can stop various attacks. They also update regularly, which helps them stay on top of new attack methods. Considering how easy these are to use and how crucial they are, there’s no reason to avoid them.\r\n\r\n2. Use strong, varied passwords\r\nAnother crucial cybersecurity step is to use strong passwords. Most hacking-related data breaches stem from weak passwords, which are easy to avoid. Cracking a 12-character password takes 62 trillion times longer than a six-character one.\r\nPasswords should be long and contain numbers, symbols and varying letter cases. It’s also important to avoid using the same one for multiple accounts, as that lets a hacker into more places with one breached password. Changing them every few months can also minimize risks.\r\n\r\n3. Enable multifactor authentication\r\nSometimes, a strong password isn’t enough. That’s why enabling multifactor authentication (MFA) is another essential cybersecurity best practice for employees and general users. MFA is quick to set up, easy to use and can stop nearly all attacks, according to some experts.\r\nMFA adds another step to the login process, most often a one-time code sent to a user’s phone. Some MFA options are more advanced, like facial recognition services or fingerprint scanners. While these features may not see as much use as they should, they’re available on most internet services.\r\n\r\n4. Verify before trusting\r\nIt’s important to verify security, since cybersecurity threats often don’t seem suspicious at first glance. Before clicking a link or responding to an email, inspect it more carefully. It could be a trap if it contains spelling errors, unusual language and is strangely urgent or seems off.\r\nThe same principle applies to internet networks, devices and applications. Never trust public Wi-Fi because anyone could use it to perform MITM attacks. Similarly, always check to make sure a program’s developer is trustworthy before downloading and installing it. Companies should apply this to business partners, too.\r\n\r\n5. Update frequently\r\nCybersecurity is a dynamic field. Criminals are always coming up with new ways to attack targets and cybersecurity tools adapt in response. That means it’s crucial to update all software regularly. Otherwise, users could be vulnerable to a weak point that app developers have already patched.\r\nSome of the most infamous cybersecurity breach examples have happened because of outdated software. In 2019, the United Nations tried to hide a data breach that used a vulnerability a current software update would have patched. This is a critical cybersecurity best practice for businesses, which may be bigger targets.\r\n\r\n6. Encrypt where possible\r\nOne more technical cybersecurity step is to encrypt sensitive data. Encryption makes information unreadable to anyone apart from its intended audience by scrambling it and giving authorized users a key to unscramble it. This doesn’t stop data breaches, but it makes them less impactful.\r\nIf a cybercriminal can’t read or understand data, it’s useless to them, making someone a less enticing target. It also ensures that any sensitive information that leaks will stay private. Using multiple encryption types such as end-to-end and at-rest encryption keeps information extra safe.\r\n\r\n7. Segment networks\r\nAn important security best practice for businesses is to segment their networks. This involves running devices and storing data on different networks to ensure a breach in one area can’t provide access to everything else. This step is especially critical for large IoT networks.\r\nThis mostly applies to organizations, but individual users can use this step, too. Running smart home devices on a different network than work or home computers is a good idea. That way, a smart TV, which is easier to hack into, doesn’t become a doorway to more sensitive data.\r\n\r\n8. Create backups of sensitive files\r\nIt’s also crucial to back up any sensitive data or programs. This won’t prevent a cyberattack, but it will minimize the damage. Stolen data or downed systems aren’t as pressing if you have extra copies you can use.\r\nWith cybercrime as rampant as it is, it’s unsafe to assume someone will never be the target of a successful breach. More than half of all consumers have been the victim of cybercrime. Since no defense is perfect, ensuring a hack won’t be crippling is essential.\r\n\r\n9. Stay informed and tell others\r\nDespite how massive a problem cybercrime is, many people don’t know cybersecurity best practices. Many simple steps can be effective. It’s just a matter of knowing what risks are out there and what to do about them. Consequently, staying informed is half the battle.\r\nThis step is an important cybersecurity best practice for employees especially. Businesses should train all workers about things like strong password management and how to spot a phishing attempt. Holding these meetings regularly can help companies stay on top of emerging threats and remain safe despite a changing landscape.\r\n\r\n10. Review security steps regularly\r\nEvery user and company should understand that today’s best practices may not work tomorrow. Cybersecurity is a continually evolving field, so it’s important to review defenses to ensure they’re still reliable. Without regular reviews, people could be vulnerable and not realize it.\r\nBusinesses can perform penetration testing, where a cybersecurity expert tries to break into their systems to reveal their weak points. Consumers can read up on the latest cybersecurity news to see what new steps they may need to take. The worst thing you can be is complacent.', 'fourth-post.jpg', '2023-05-23 02:58:56'),
(5, 'fifth-post', 'Cybersecurity is essential for everyone', 'none', 'Admin', 'After learning what cybersecurity is and why it’s important, it’s easy to see why it’s in such high demand. This can be a complicated topic, but it’s essential. Everyone, from the world’s most powerful CEOs to casual Twitter users, should understand the importance of cybersecurity.\r\n\r\nThese cybersecurity examples are just a sampling of the threats and defense steps out there today. Understanding these basics is the first step to staying safe in today’s digital world.', 'first-post.jpg', '2023-05-23 03:07:49'),
(6, 'six-post', 'The Different Types of Cybersecurity', 'no tag', 'Admin', 'Cyber security is a wide field covering several disciplines. It can be divided into seven main pillars:\r\n\r\n1. Network Security:\r\n\r\nMost attacks occur over the network, and network security solutions are designed to identify and block these attacks. These solutions include data and access controls such as Data Loss Prevention (DLP), IAM (Identity Access Management), NAC (Network Access Control), and NGFW (Next-Generation Firewall) application controls to enforce safe web use policies.\r\n\r\nAdvanced and multi-layered network threat prevention technologies include IPS (Intrusion Prevention System), NGAV (Next-Gen Antivirus), Sandboxing, and CDR (Content Disarm and Reconstruction). Also important are network analytics, threat hunting, and automated SOAR (Security Orchestration and Response) technologies.\r\n\r\n2. Cloud Security:\r\n\r\nAs organizations increasingly adopt cloud computing, securing the cloud becomes a major priority. A cloud security strategy includes cyber security solutions, controls, policies, and services that help to protect an organization’s entire cloud deployment (applications, data, infrastructure, etc.) against attack.\r\n\r\nWhile many cloud providers offer security solutions, these are often inadequate to the task of achieving enterprise-grade security in the cloud. Supplementary third-party solutions are necessary to protect against data breaches and targeted attacks in cloud environments.\r\n\r\n3. Endpoint Security:\r\n\r\nThe zero-trust security model prescribes creating micro-segments around data wherever it may be. One way to do that with a mobile workforce is using endpoint security. With endpoint security, companies can secure end-user devices such as desktops and laptops with data and network security controls, advanced threat prevention such as anti-phishing and anti-ransomware, and technologies that provide forensics such as endpoint detection and response (EDR) solutions.\r\n\r\n\r\n4. Mobile Security: \r\n\r\nOften overlooked, mobile devices such as tablets and smartphones have access to corporate data, exposing businesses to threats from malicious apps, zero-day, phishing, and IM (Instant Messaging) attacks. Mobile security prevents these attacks and secures the operating systems and devices from rooting and jailbreaking. When included with an MDM (Mobile Device Management) solution, this enables enterprises to ensure only compliant mobile devices have access to corporate assets.\r\n\r\n5. IoT Security:\r\n\r\nWhile using Internet of Things (IoT) devices certainly delivers productivity benefits, it also exposes organizations to new cyber threats. Threat actors seek out vulnerable devices inadvertently connected to the Internet for nefarious uses such as a pathway into a corporate network or for another bot in a global bot network.\r\n\r\nIoT security protects these devices with discovery and classification of the connected devices, auto-segmentation to control network activities, and using IPS as a virtual patch to prevent exploits against vulnerable IoT devices. In some cases, the firmware of the device can also be augmented with small agents to prevent exploits and runtime attacks.\r\n\r\n6. Application Security:\r\n\r\nWeb applications, like anything else directly connected to the Internet, are targets for threat actors. Since 2007, OWASP has tracked the top 10 threats to critical web application security flaws such as injection, broken authentication, misconfiguration, and cross-site scripting to name a few.\r\n\r\nWith application security, the OWASP Top 10 attacks can be stopped. Application security also prevents bot attacks and stops any malicious interaction with applications and APIs. With continuous learning, apps will remain protected even as DevOps releases new content.\r\n\r\n7. Zero Trust:\r\n\r\nThe traditional security model is perimeter-focused, building walls around an organization’s valuable assets like a castle. However, this approach has several issues, such as the potential for insider threats and the rapid dissolution of the network perimeter.\r\n\r\nAs corporate assets move off-premises as part of cloud adoption and remote work, a new approach to security is needed. Zero trust takes a more granular approach to security, protecting individual resources through a combination of micro-segmentation, monitoring, and enforcement of role-based access controls.\r\n\r\n', 'second-post.jpeg', '2023-05-23 11:37:56'),
(7, 'seventh-post', 'The Evolution of the Cyber Security Threat Landscape\r\n', 'The cyber threats of today are not the same as even a few years ago. As the cyber threat landscape changes, organizations need protection against cybercriminals’ current and future tools and techniques.', 'Admin', 'Gen V Attacks\r\n\r\n\r\nThe cyber security threat landscape is continually evolving, and, occasionally, these advancements represent a new generation of cyber threats. To date, we have experienced five generations of cyber threats and solutions designed to mitigate them, including:\r\n\r\n\r\nGen I (Virus): In the late 1980s, virus attacks against standalone computers inspired the creation of the first antivirus solutions.\r\n\r\n\r\nGen II (Network): As cyberattacks began to come over the Internet, the firewall was developed to identify and block them.\r\n\r\n\r\nGen III (Applications): Exploitation of vulnerabilities within applications caused the mass adoption of intrusion prevention systems (IPS)\r\n\r\n\r\nGen IV (Payload): As malware became more targeted and able to evade signature-based defenses, anti-bot and sandboxing solutions were necessary to detect novel threats.\r\n\r\n\r\nGen V (Mega): The latest generation of cyber threats uses large-scale, multi-vectors attacks, making advanced threat prevention solutions a priority.\r\n\r\n\r\nEach generation of cyber threats made previous cyber security solutions less effective or essentially obsolete. Protecting against the modern cyber threat landscape requires Gen V cyber security solutions.', 'third-post.jpg', '2023-05-23 11:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `sno` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
