# ========================================
# Scoop���C���X�g�[�����邽�߂̃o�b�`
# ----------------------------------------
# �C���X�g�[���ꏊ�F C:\usr\local\scoop
# ========================================

# Powershell�o�b�`�t�@�C���̎��s������ύX����
set-executionpolicy remotesigned -scope currentuser

# Scoop�̃C���X�g�[���f�B���N�g�������ϐ��ɐݒ肷��
$env:SCOOP='C:\usr\local\scoop'
[environment]::setEnvironmentVariable('SCOOP',$env:SCOOP,'User')

# Scoop���C���X�g�[������
Write-output Scoop�̃C���X�g�[�����J�n���܂��B
iwr -useb get.scoop.sh | iex
