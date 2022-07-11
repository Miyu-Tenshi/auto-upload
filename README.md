# Auto upload

push your project to github repository

อัพโหลดโปรเจคไปที่ github อัตโนมัติ

## วิธีใช้งาน

### 1. ใช้คำสั่ง git clone เพื่อ clone มาไว้ในโปรเจคของเรา

```bash
git clone https://github.com/Miyu-Tenshi/auto-upload.git
```

### 2. ใช้คำสั่ง alias เพื่อย่อคำสั่งการใช้งาน

```bash
alias upload=$PWD/auto-upload/upload.sh
```

### 3. ใช้คำสั่ง chmod เพื่อเพิ่มการอนุญาตให้ไฟล์สามารถรันได้

```bash
chmod +x $PWD/auto-upload/upload.sh
```

### 4. พิมพ์ upload init หรือ upload -i เพื่อเริ่มใช้งาน

```bash
upload init
```

---

---

-   ข้อ 1 จะถาม USERNAME ให้ใส่ ชื่อบน github ของเราไป (ไม่ใช่ชื่อเล่นนะ)
-   ข้อ 2 จะถาม EMAIL ให้ใส่ email ที่เชื่อมกับ github ไป
-   ข้อ 3 จะถาม URL ให้ใส่ link repository บน github สามารถไปกด copy มาได้ จะมีปุ่มเขียวๆ กดไปแล้วจะเจอ link ให้ copy มาใส่
-   ข้อ 4 ให้ใส่ BRANCH เราก็ใส่ไปว่าจะให้ไปอยู่ branch ไหน หลักๆ ก็มี main เป็นต้น
-   ข้อสุดท้าย COMMIT MESSAGE ให้ใส่ข้อความแนบไปว่าเราทำอะไรไปบ้าง ในโปรเจค หรือไม่ใส่ก็ไดนะ มันก็จะขึ้นข้อความว่า no comment แทน

---

---

เวลาครั้งต่อไปจะ upload ก็แค่พิมพ์ upload มันก็จะถามแค่ COMMIT MESSAGE อย่างเดียวแล้ว

## สิ่งที่จะทำต่อในอนาคต

-   เพิ่ม option แก้ไขข้อมูล
-   เพิ่ม option help
