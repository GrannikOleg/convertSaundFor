#!/bin/bash
 echo -e  " \e[34m +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+ \e[0m" | pv -qL 90
 echo -e  " \e[34m | \e[1;36m*** ffmpeg конвертирование аудио файлов циклом for ***\e[0m \e[34m                   | \e[0m" | pv -qL 30
 echo -e  " \e[34m +---------------------------------------------------------------------------+ \e[0m" | pv -qL 90
 echo -en " \e[34m |\e[32m Введите расширение входных input файлов: \e[0m" | pv -qL 20
 read b
 echo -e  " \e[34m |\e[31m $b \e[0m" | pv -qL 15
#
 echo -en " \e[34m |\e[32m Введите кодек, значения: mp3 pcm_u8 pcm_s16le : \e[0m" | pv -qL 20
 read g
 echo -e  " \e[34m |\e[31m $g \e[0m" | pv -qL 15
#
 echo -en " \e[34m |\e[32m Введите частоту дискретизации звука, значения: 22050 44100 48000 : \e[0m" | pv -qL 20
 read d
 echo -e  " \e[34m |\e[31m $d \e[0m" | pv -qL 15
#
 echo -en " \e[34m |\e[32m Введите количество каналов: 1 2 : \e[0m" | pv -qL 20
 read h
 echo -e  " \e[34m |\e[31m $h \e[0m" | pv -qL 15
#
 echo -en " \e[34m |\e[32m Введите битрейт, значения: 64 96 112 128 160 192 256 320 : \e[0m" | pv -qL 20
 read e
 echo -e  " \e[34m |\e[31m $e \e[0m" | pv -qL 15
#
 echo -en " \e[34m |\e[32m Введите расширение выходных output файлов : \e[0m" | pv -qL 20
 read c
 echo -e  " \e[34m |\e[31m $c \e[0m" | pv -qL 15
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
for f in *.$b
 do
  name=`echo "$f" | sed -e "s/.$b$//g"`
   ffmpeg -i "$f" -acodec $g -vn -ar $d -ac $h -ab $e -f $c "$name.$c"
 done
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
 echo -e  " \e[32mclear\e[0m" | pv -qL 15
 clear
 echo -e  " \e[32mls -l\e[0m" | pv -qL 15
 ls -l
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# ffmpeg -i input.mp4 -acodec copy -vn output.aac
# ffmpeg -i audio.wav -acodec mp3 -ab 192k audio.mp3
#-------------------------------------------------------------------------------------------------------------------------
# ffmpeg утилита
# -i     преобразовать в формат
# -vn    говорит о том, что мы отключили запись видео в конечный файл.
# -ar    задает частоту дискретизации звука конечного файла. Наиболее широко используются значения: 22050, 44100, 48000 Гц.
# -ac    задает количество аудиоканалов 1 и 2.
# -ab    задает битрейт. Наиболее широко используются значения: 64k 192k 320k
# -f     формат конечного файла
#--------------------------------------------------------------------------------------------------------------------------
# Форматирование звука
# MP3  -> MP3
# MP3  -> OGG
# WMA  -> MP3
# MP3  -> AMR
# WAV  -> AMR
# MPEG -> MP3
# MIDI -> WAV
# MIDI -> OGG
#=========================================================================================================================
# ConvertSaundFor
# Простая утилита на основе ffmpeg, для конвертации аудиофайлов циклом for в Linux Terminal
# convertSaundForPs.sh вариант с псевдографикой
# convertSaundForCo.sh вариант без псевдографики и clear ls -l
# https://asciinema.org/a/469143
# https://github.com/GrannikOleg/convertSaundFor
# https://gitlab.com/GrannikOleg/convertsaundfor
# https://sourceforge.net/projects/convertsaundfor/files/
# https://framagit.org/GrannikOleg/convertsaundfor
#-------------------------------------------------------------------------------------------------------------------------
