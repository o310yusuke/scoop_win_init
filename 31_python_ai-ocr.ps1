# ========================================
# Python��AI-OCR�𗘗p���邽�߂̃c�[���C���X�g�[��
# ----------------------------------------
# ���L�����Ȃ�
# ========================================

# tesseract���C���X�g�[��
scoop install tesseract

# tesseract�̌���t�@�C�����C���X�g�[��
scoop install tesseract-languages

# pyocr���C���X�g�[��
Write-Output "----------------------------------------"
Write-Output "pyocr���C���X�g�[�����܂��傤�B���̂��߂ɂ܂�Python���z�����������܂��傤�B"
Write-Output "    $ cd [project directory]" "    $ python -m venv [new venv name]"
Write-Output "    ��[new venv name]�́uvenv�v�ɂ��Ă����ƁA���̂��߂̃f�B���N�g������ŕ�����₷��"
Write-Output "���z�����쐬��ɉ��L�R�}���h�����s����pyocr���C���X�g�[��"
Write-Output "    $ python -m pip install pyocr"
Write-Output "----------------------------------------"

# VSCode�g���@�\���C���X�g�[��
# code --install-extension [name]
