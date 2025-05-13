# Personel Yönetimi Veritabanı 
Temel bir personel yönetimi sistemi için gerekli olan SQL Server veritabanı şemasını ve örnek verilerini içermektedir. Amaç, departmanlar, çalışanlar, maaş bilgileri, genel tanımlamalar ve kullanıcılar gibi temel şirket verilerini düzenli bir şekilde saklamaktır.

## Ne İşe Yarar?
* **Veritabanı Oluşturma:** `_db` adında yeni bir SQL Server veritabanı oluşturur.
* **Tablo Oluşturma:** Aşağıdaki tabloları tanımlar ve şemasını oluşturur:
    * `tbl_Departments`: Şirketteki departman bilgilerini (ID, Adı, Telefon, Yönetici ID).
    * `tbl_Employees`: Çalışanların temel bilgilerini (ID, Adı, Soyadı, Doğum Tarihi, Aktiflik Durumu, İşe Giriş/Çıkış Tarihleri, Maaş, Cinsiyet ID, Unvan ID, Departman ID, İletişim Bilgileri vb.).
    * `tbl_EmployeeWages`: Çalışanların maaş ödeme kayıtlarını (ID, Çalışan ID, Ödeme Tarihi, Maaş Miktarı, Komisyon, Ay ID, Yıl, Toplam Maaş).
    * `tbl_Lookups`: Sabit listeleri ve genel tanımlamaları (Unvanlar, Cinsiyetler, Aylar, Şehirler, İller, Kullanıcı Tipleri, Ülkeler, Roller).
    * `tbl_Users`: Sistem kullanıcılarının bilgilerini (ID, Kullanıcı Adı, Şifre, Kullanıcı Tipi ID, Rol ID).
* **Örnek Veri Girişi:** Yukarıda belirtilen tablolara temel örnek kayıtlar ekler. Bu, veritabanının yapısını anlamak ve test etmek için faydalıdır.
* **İlişkisel Bütünlük:** Tablolar arasında Foreign Key kısıtlamaları tanımlayarak veri bütünlüğünü sağlar (örneğin, bir çalışanın geçerli bir departmana atanması, maaş kaydının var olan bir çalışana ait olması gibi).
* **Varsayılan Değerler:** Bazı alanlara varsayılan değerler atayarak veri girişini kolaylaştırır (örneğin, yeni bir çalışanın varsayılan olarak aktif olması, işe başlama tarihinin bugünün tarihi olması gibi).

## Kullanılan Teknolojiler
* **SQL Server:** Veritabanı yönetim sistemi olarak Microsoft SQL Server kullanılmaktadır.
* **Transact-SQL (T-SQL):** Veritabanı nesnelerini oluşturmak, veri eklemek ve ilişkileri tanımlamak için kullanılan SQL Server'a özgü dil.

## Başlangıç
1.  **SQL Server Kurulumu:** Bilgisayarınızda bir SQL Server kurulumunun olduğundan emin olun.
2.  **SQL Server Management Studio (SSMS):** Veritabanını yönetmek ve bu scripti çalıştırmak için SSMS veya benzeri bir SQL Server yönetim aracını kullanın.
3.  **Scripti Çalıştırma:** Bu `.sql` dosyasının içeriğini SSMS'de yeni bir sorgu penceresine yapıştırın ve çalıştırın. Bu işlem, `_db` veritabanını ve içindeki tabloları oluşturacak ve örnek verileri ekleyecektir.

