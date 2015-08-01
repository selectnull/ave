from distutils.core import setup

setup(
    name='ave',
    version='0.8.0',
    author='Sasha Matijasic',
    author_email='sasha@selectnull.com',
    scripts=['ave.sh', ],
    url='https://github.com/selectnull/ave',
    license='LICENSE',
    description='ave Activates Virtual Environment',
    long_description=open('README.md').read(),
)
