# 📘 Social Media Platform – Database

Bu loyiha **social media platform** uchun yaratilgan **ma’lumotlar bazasi dizayni** hisoblanadi. Unda foydalanuvchilar, postlar, izohlar, yoqtirishlar, followerlar, xabarlar va taglar bilan ishlash imkoniyati mavjud.

---

## 🔹 Project haqida

Ushbu ma’lumotlar bazasi quyidagi asosiy imkoniyatlarni taqdim etadi:

* Foydalanuvchilar ro‘yxatdan o‘tadi, profilga ega bo‘ladi.
* Postlar yaratadi va ularga rasm yoki matn joylaydi.
* Postlarga izoh va “like” qoldiradi.
* Bir-birlarini kuzatadi (follow/unfollow).
* To‘g‘ridan-to‘g‘ri xabarlar (private chat) yuboradi.
* Postlarga teglar qo‘shib, kontentni tartiblaydi.

---

## 🔹 Resurslar

### 1. **Users (foydalanuvchilar)**

* `id` – foydalanuvchi noyob identifikatori.
* `username` – foydalanuvchi nomi (unique).
* `email` – elektron pochta (unique).
* `password_hash` – parolning xavfsiz xeshlangan ko‘rinishi.
* `full_name` – foydalanuvchi to‘liq ismi.
* `bio` – foydalanuvchi haqida qisqacha ma’lumot.
* `created_at` – hisob yaratilgan vaqt.

---

### 2. **Posts (postlar)**

* `id` – post identifikatori.
* `user_id` – post egasi bo‘lgan foydalanuvchi.
* `content` – post matni.
* `image_url` – post rasmi (ixtiyoriy).
* `created_at` – post yaratilgan vaqt.

---

### 3. **Comments (izohlar)**

* `id` – izoh identifikatori.
* `post_id` – qaysi postga izoh yozilganligi.
* `user_id` – izohni kim yozgani.
* `content` – izoh matni.
* `created_at` – izoh yozilgan vaqt.

---

### 4. **Likes (yoqtirishlar)**

* `user_id` – postni yoqtirgan foydalanuvchi.
* `post_id` – yoqtirilgan post.
* `created_at` – yoqtirish vaqti.

---

### 5. **Followers (kuzatuvchilar)**

* `follower_id` – kim follow qilmoqda.
* `following_id` – kimni follow qilmoqda.
* `created_at` – follow qilingan vaqt.

---

### 6. **Tags va Post Tags (teglar)**

* **Tags**:

  * `id` – tag identifikatori.
  * `name` – tag nomi.
* **Post Tags**:

  * `post_id` – post identifikatori.
  * `tag_id` – tag identifikatori.

---

### 7. **Messages (xabarlar)**

* `id` – xabar identifikatori.
* `sender_id` – xabarni yuborgan foydalanuvchi.
* `receiver_id` – xabarni qabul qiluvchi foydalanuvchi.
* `content` – xabar matni.
* `created_at` – xabar yuborilgan vaqt.

---

## 🔹 Relationshiplar

* **Users → Posts**: Bitta foydalanuvchi ko‘plab postlar yarata oladi (**1\:N**).
* **Posts → Comments**: Bitta postda ko‘plab izohlar bo‘lishi mumkin (**1\:N**).
* **Users ↔ Posts (Likes)**: Ko‘p foydalanuvchi ko‘p postni yoqtirishi mumkin (**M\:N**).
* **Users ↔ Users (Followers)**: Foydalanuvchi boshqa foydalanuvchini follow qiladi (**self-referencing M\:N**).
* **Posts ↔ Tags**: Post bir nechta tagga tegishli bo‘lishi mumkin, tag esa ko‘plab postlarga biriktirilishi mumkin (**M\:N**).
* **Users ↔ Users (Messages)**: Foydalanuvchilar bir-birlariga ko‘plab xabar yuborishi mumkin (**self-referencing 1\:N**).

---

## Practice uchun tasklar

## 👤 Users

1. **Yangi foydalanuvchini qo‘shish** (`INSERT INTO users ...`).
2. Barcha foydalanuvchilarni `created_at` bo‘yicha **oxirgilardan boshlab chiqarish**.
3. **Eng ko‘p follower’ga ega foydalanuvchini** topish.
4. Har bir user uchun **followerlar sonini sanash**.
5. Faqat **bio to‘ldirilgan foydalanuvchilarni** chiqarish.

---

## 📝 Posts

6. Ma’lum bir user’ning barcha postlarini chiqarish.
7. **Eng ko‘p post qilgan 5 ta user**ni chiqarish.
8. **Oxirgi 24 soat ichida yaratilgan postlarni** ko‘rsatish.
9. Har bir post uchun **like sonini** sanab chiqarish.
10. Eng ko‘p like yig‘gan **top 3 ta post**ni chiqarish.

---

## 💬 Comments

11. Ma’lum bir post’ning barcha commentlarini chiqarish (username bilan birga).
12. Har bir user nechta comment qoldirganini sanash.
13. **Eng ko‘p comment yozgan user**ni topish.
14. Bir postda **ko‘p comment yozgan top 3 user**ni chiqarish.

---

## ❤️ Likes

15. Ma’lum bir user qaysi postlarni yoqtirganini chiqarish.
16. Har bir user nechta postni yoqtirganini sanash.
17. **Eng ko‘p like bosgan user**ni topish.
18. **Eng ko‘p like olingan postlar** ro‘yxatini chiqarish (ranking).

---

## 👥 Followers

19. Bir userning barcha **followerlari**ni chiqarish.
20. Bir user kimlarni **follow qilayotganini** chiqarish.
21. **Eng ko‘p odamni follow qilayotgan user**ni topish.
22. **O‘zaro follow qilayotgan (mutual followers)** userlarni chiqarish.

---

## 🏷️ Tags

23. Har bir postning **taglarini chiqarish**.
24. Bir tag’ga tegishli barcha postlarni chiqarish.
25. **Eng ko‘p ishlatilgan tag**ni topish.
26. User’ning postlarida eng ko‘p ishlatilgan tag’ni chiqarish.

---

## 📩 Messages

27. Ma’lum bir user yuborgan barcha xabarlarni ko‘rsatish.
28. Bir user va boshqa user o‘rtasidagi **chat tarixini** chiqarish.
29. Har bir user nechta xabar yuborganini sanash.
30. **Eng ko‘p xabar yuborgan user**ni topish.

---

## 📊 Advanced (Real Analytics Case)

31. Har bir user uchun **posts, comments, likes soni bilan profil statistikasi**ni chiqarish.
32. Foydalanuvchilar orasida **eng ko‘p interaktiv (post + comment + like)** qilganlarini chiqarish.
33. Bir user’ning **feed**’ini chiqarish: (u follow qilgan odamlarning postlari, like soni bilan birga).
34. Oxirgi 7 kunda **eng faol 5 ta user**ni topish (post + comment + like asosida).
35. Har bir post uchun `like_ratio` chiqarish → `(likes soni / followers soni) * 100`.
36. Bir user qaysi **followerlari bilan eng ko‘p chat qilganini** ko‘rsatish.
37. Oxirgi 30 kunda eng ko‘p ishlatilgan **top 10 tag**ni chiqarish.
38. Har bir follower uchun `mutual_followers_count` (o‘zaro followerlar soni) chiqarish.
39. User activity summary: `total_posts, total_comments, total_likes, total_followers`.
40. **Trend bo‘layotgan postlar** → Oxirgi 24 soatda eng ko‘p like + comment olgan postlar.
