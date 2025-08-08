import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  late Database _database;
  static const _databaseName = "medical_app.db";
  static const _databaseVersion = 1;
  var logger = Logger();

  Future<Database> get database async {
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(_databaseName, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE patients (id INTEGER PRIMARY KEY, name TEXT, birth_date TEXT, phone_number TEXT, email TEXT, gender TEXT, patient_photo TEXT, description TEXT, last_appointment TEXT)");
      await db.execute(
          "CREATE TABLE appointments (id INTEGER PRIMARY KEY, appointment_date INTEGER, appointment_hour TEXT, patient_id INTEGER, type TEXT, status TEXT)");
    });
  }

  insertData(Map<String, dynamic> data) async {
    final db = await database;
    logger.i(data);
    return await db.insert("patients", data);
  }

  insertAppoinmentData(Map<String, dynamic> data) async {
    final db = await database;
    logger.i(data);
    return await db.insert("appointments", data);
  }

  // Future<List<Patient>> getPatients() async {
  //   try {
  //     final db = await database;
  //     final List<Map<String, dynamic>> maps =
  //         await db.query('patients', orderBy: 'name ASC');

  //     return List.generate(maps.length, (i) {
  //       return Patient(
  //         id: maps[i]['id'] ?? '',
  //         name: maps[i]['name'] ?? '',
  //         patientPhoto: maps[i]['patient_photo'] ?? '',
  //         phoneNumber: maps[i]['phone_number'] ?? '',
  //         email: maps[i]['email'] ?? '',
  //         gender: maps[i]['gender'] ?? '',
  //         description: maps[i]['description'] ?? '',
  //         lastAppointment: maps[i]['last_appointment'] ?? '',
  //         birthDate: maps[i]['birth_date'] ?? '',
  //       );
  //     });
  //   } catch (error) {
  //     logger.e(error);
  //     return [];
  //   }
  // }

  // Future<List<Appointment>> getAppointmentsByDate(String filteredDate) async {
  //   try {
  //     final db = await database;
  //     final List<Map<String, dynamic>> maps = await db.query('appointments',
  //         where: 'appointment_date = ?',
  //         whereArgs: [
  //           DateFormat('dd/MM/yyyy').parse(filteredDate).millisecondsSinceEpoch
  //         ],
  //         orderBy: 'appointment_hour ASC');

  //     return List.generate(maps.length, (i) {
  //       logger.i(maps[i]);

  //       return Appointment(
  //         id: maps[i]['id'] ?? '',
  //         patientId: maps[i]['patient_id'] ?? '',
  //         date: DateTime.fromMillisecondsSinceEpoch(
  //             maps[i]['appointment_date'] as int),
  //         hour: maps[i]['appointment_hour'] ?? '00:00',
  //         status: maps[i]['status'] ?? '',
  //         type: maps[i]['type'] ?? '',
  //       );
  //     });
  //   } catch (error) {
  //     logger.e(error.toString());
  //     return [];
  //   }
  // }

  // Future<List<Appointment>> getAppointmentsAll() async {
  //   try {
  //     final db = await database;
  //     final List<Map<String, dynamic>> maps =
  //         await db.query('appointments', orderBy: 'appointment_hour ASC');

  //     return List.generate(maps.length, (i) {
  //       return Appointment(
  //         id: maps[i]['id'] ?? '',
  //         patientId: maps[i]['patient_id'] ?? '',
  //         date: DateTime.now(),
  //         hour: maps[i]['appointment_hour'] ?? '00:00',
  //         status: maps[i]['status'] ?? '',
  //         type: maps[i]['type'] ?? '',
  //       );
  //     });
  //   } catch (error) {
  //     logger.e(error);
  //     return [];
  //   }
  // }

  // Future<List<Appointment>> getAppointmentsToday() async {
  //   var todayDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  //   try {
  //     final db = await database;
  //     final List<Map<String, dynamic>> maps = await db.query('appointments',
  //         where: 'appointment_date = ?',
  //         whereArgs: [
  //           DateFormat('dd/MM/yyyy').parse(todayDate).millisecondsSinceEpoch
  //         ],
  //         orderBy: 'appointment_hour ASC');

  //     return List.generate(maps.length, (i) {
  //       return Appointment(
  //         id: maps[i]['id'] ?? '',
  //         patientId: maps[i]['patient_id'] ?? '',
  //         date: DateTime.fromMillisecondsSinceEpoch(
  //             maps[i]['appointment_date'] as int),
  //         hour: maps[i]['appointment_hour'] ?? '00:00',
  //         status: maps[i]['status'] ?? '',
  //         type: maps[i]['type'] ?? '',
  //       );
  //     });
  //   } catch (error) {
  //     logger.e(error);
  //     return [];
  //   }
  // }

  closeDB() async {
    final db = await database;
    db.close();
  }
}
