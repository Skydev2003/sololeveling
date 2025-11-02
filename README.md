Sololeveling — Fitness RPG (Minimal)

สรุปสั้น ๆ (ไทย)

Sololeveling เป็นตัวอย่างแอปฝึกร่างกายในรูปแบบ RPG: ผู้เล่นเก็บ XP จากเควสประจำวันและเลเวลอัพ
- State management: flutter_riverpod
- Routing: go_router
- Theme & Font: Kanit (Google Fonts), ธีมโทนดำ-ม่วง
- Persistence: SharedPreferences (บันทึกผู้เล่นและเควส)

โครงสร้างสำคัญ

- `lib/main.dart` — entry, ProviderScope และ router
- `lib/src/theme` — ธีม (AppTheme)
- `lib/src/routes` — router provider
- `lib/src/models` — Player, Quest, CharacterClass
- `lib/src/providers` — Riverpod providers (player, quest, classes)
- `lib/src/pages` — หน้า UI (Home, Status, Classes, Quests)
- `lib/src/widgets` — UI components (StatCard, QuestTile)

วิธีรัน (Windows PowerShell)

1. เปิด terminal ไปที่โฟลเดอร์โปรเจค

```powershell
cd C:\Users\thiti\Apps\sololeveling
flutter pub get
flutter run
```

หมายเหตุ & Next steps

- ปัจจุบันใช้ SharedPreferences สำหรับ persistence แบบเรียบง่าย — หากต้องการฐานข้อมูลเร็วและซับซ้อนขึ้น แนะนำใช้ Hive หรือ sembast
- เพิ่ม UI polish (illustrations, animations) และทดสอบหน่วยเพิ่มเติมได้
- ถ้าต้องการ ให้ผมเพิ่มระบบเลือกคลาสถาวร, achievements, หรือต่อกับ notifications (local) ได้

English summary

A minimal Flutter demo app that turns workouts into quests and rewards XP. Uses Riverpod for state, GoRouter for navigation, Kanit font, dark purple theme and SharedPreferences for persistence.

If you'd like any changes (Hive persistence, prettier assets, animations or tests), tell me which to add next.
