import 'package:jiji_clone/core/api/skill_api.dart';
import 'package:jiji_clone/core/model/skills_model.dart';
import 'package:jiji_clone/core/utils/auth_exception.dart';
import 'package:jiji_clone/core/view_models/base_vm.dart';
import 'package:jiji_clone/locator.dart';

class SkillsViewModel extends BaseModel {
  final SkillsApi _skillsApi = locator<SkillsApi>();

  String error;

  //get all skills
  List<SkillsModel> allSkills;

  Future<void> getAllSkills() async {
    setBusy(true);
    try {
      allSkills = await _skillsApi.getAllSkills();
      setBusy(false);
    } on AuthException catch (e) {
      setBusy(false);
      await dialog.showDialog(
          title: 'Error!', description: e.message, buttonTitle: 'Close');
      notifyListeners();
    }
  }
}
