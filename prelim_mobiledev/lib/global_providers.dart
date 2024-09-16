import 'package:riverpod/riverpod.dart';

import 'package:prelim_mobiledev/services/contact_service.dart';

final contactServiceProvider = Provider((ref) => ContactService(ref));