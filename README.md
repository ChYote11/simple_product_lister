## Screenshots

### Product List Screen

[Product List Screen](screenshots/product_list.png)

### Error Product List Screen

[Product List Screen](screenshots/error_dialog_product_list.png)
[Product List Screen](screenshots/error_product_list.png)

### Product Detail Screen

[Product Detail Screen](screenshots/product_detail.png)

## การจัดการ State (State Management)

ในหน้าจอ **Product List Page** ผมใช้ **Product List Page** ที่เป็น `StatelessWidget` ครอบ Widge **Product List** ที่เป็น `StatefulWidget` และใช้ร่วมกับ `setState`
เพื่อจัดการสถานะของ UI ซึ่งแบ่งออกเป็น 3 สถานะหลัก ได้แก่

- **Loading State**  
  แสดง `CircularProgressIndicator` ระหว่างรอการดึงข้อมูลจาก API

- **Data State**  
  หน้า Product List ใช้ StatefulWidget ร่วมกับ Service Layer
  เพื่อแยกความรับผิดชอบระหว่างการดึงข้อมูลและการแสดงผล
  โดยจัดการ State ได้แก่ Loading, Error, Empty และ Data ภายใน StatefulWidget ของ Product List

- **Error State**  
  หากเกิดข้อผิดพลาด เช่น การเชื่อมต่ออินเทอร์เน็ตล้มเหลว
  จะมีการแสดง Dialog เพื่อแจ้งให้ผู้ใช้ทราบ

---

## การใช้ AI Tools (Optional)

ผมใช้ AI Tools เพื่อช่วยในส่วนต่าง ๆ ระหว่างการพัฒนาโปรเจกต์ เช่น

- การปรับแก้ UI บางส่วน
- ปรับปรุงโครงสร้างโค้ดและแนวทางปฏิบัติที่ดี
