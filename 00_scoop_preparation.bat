@echo off
cd /d %~dp0

rem ========================================
rem scoop��p���ĊJ�������������邽�߂̃o�b�`
rem ----------------------------------------
rem ���L�����Ȃ�
rem ========================================

rem Scoop�C���X�g�[���p�̃o�b�`�t�@�C�����Ăяo��
powershell -NoProfile -ExecutionPolicy remotesigned .\01_scoop_install.ps1

rem ���[�e�B�����C���X�g�[��
powershell .\02_scoop_utils.ps1

rem VScode���C���X�g�[��
powershell .\05_vscode.ps1
