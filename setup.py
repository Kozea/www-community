from setuptools import find_packages, setup

tests_requirements = [
    'pytest',
    'pytest-cov',
    'pytest-flake8',
    'pytest-isort',
]

setup(
    name="www-community",
    version="0.1.dev0",
    description="Website for Kozea Community",
    url="https://community.kozea.fr",
    author="Kozea",
    packages=find_packages(),
    include_package_data=True,
    scripts=['community.py'],
    install_requires=[
        'Flask',
        'libsass',
    ],
    tests_require=tests_requirements,
    extras_require={'test': tests_requirements}
)
