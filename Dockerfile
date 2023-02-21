FROM rockylinux:9
LABEL maintainer="Dmitry Konovalov"
ENV LANG=ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8
RUN yum -y update
RUN yum -y install wget nano mc php epel-release git wget 1> /dev/null
RUN yum config-manager --enable crb 1> /dev/null
RUN yum group -y install "Development Tools" 1> /dev/null
RUN wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20-current.tar.gz
RUN tar xvfz asterisk-20-current.tar.gz
RUN cd asterisk-20.0.0/
RUN contrib/scripts/install_prereq install
RUN ./configure --libdir=/usr/lib64 --with-jansson-bundled=yes
RUN menuselect/menuselect \
--disable chan_mobile \
--disable chan_ooh323 \
--enable format_mp3 \
--enable res_config_mysql \
--enable app_agent_pool \
--enable app_authenticate \
--enable app_bridgeaddchan \
--enable app_bridgewait \
--enable app_cdr \
--enable app_celgenuserevent \
--enable app_channelredirect \
--enable app_chanspy \
--enable app_confbridge \
--enable app_controlplayback \
--enable app_db \
--enable app_dial \
--enable app_directed_pickup \
--enable app_directory \
--enable app_disa \
--enable app_dumpchan \
--enable app_echo \
--enable app_exec \
--enable app_flash \
--enable app_followme \
--enable app_forkcdr \
--enable app_milliwatt \
--enable app_mixmonitor \
--enable app_originate \
--enable app_page \
--enable app_playback \
--enable app_playtones \
--enable app_privacy \
--enable app_queue \
--enable app_read \
--enable app_readexten \
--enable app_record \
--enable app_sayunixtime \
--enable app_senddtmf \
--enable app_sendtext \
--disable app_skel \
--enable app_softhangup \
--enable app_speech_utils \
--enable app_stack \
--enable app_stasis \
--enable app_stream_echo \
--enable app_system \
--enable app_talkdetect \
--enable app_transfer \
--enable app_userevent \
--enable app_verbose \
--enable app_voicemail \
--enable app_voicemail_imap \
--disable app_voicemail_odbc \
--enable app_waituntil \
--enable app_while \
--enable app_alarmreceiver \
--enable app_amd \
--enable app_attended_transfer \
--enable app_audiosocket \
--enable app_blind_transfer \
--enable app_chanisavail \
--enable app_dictate \
--enable app_dtmfstore \
--enable app_externalivr \
--enable app_festival \
--disable app_ivrdemo \
--enable app_jack \
--enable app_mf \
--enable app_minivm \
--enable app_morsecode \
--enable app_mp3 \
--enable app_reload \
--enable app_saycounted \
--enable app_sf \
--enable app_sms \
--disable app_statsd \
--enable app_test \
--enable app_waitforcond \
--enable app_waitforring \
--enable app_waitforsilence \
--enable app_zapateller \
--enable app_adsiprog \
--enable app_getcpeid \
--disable app_macro \
--enable app_meetme \
--enable app_osplookup \
--enable bridge_builtin_features \
--enable bridge_builtin_interval_featur \
--enable bridge_holding \
--enable bridge_native_rtp \
--enable bridge_simple \
--enable bridge_softmix \
--disable binaural_rendering_in_bridge_s \
--enable cdr_adaptive_odbc \
--enable cdr_custom \
--enable cdr_manager \
--enable cdr_beanstalkd \
--enable cdr_csv \
--enable cdr_odbc \
--enable cdr_pgsql \
--enable cdr_radius \
--enable cdr_sqlite3_custom \
--enable cdr_tds \
--enable cel_custom \
--enable cel_manager \
--enable cel_odbc \
--enable cel_beanstalkd \
--enable cel_pgsql \
--enable cel_radius \
--enable cel_sqlite3_custom \
--enable cel_tds \
--enable chan_bridge_media \
--enable chan_dahdi \
--enable chan_iax2 \
--enable chan_motif \
--enable chan_pjsip \
--enable chan_rtp \
--enable chan_audiosocket \
--enable chan_console \
--enable chan_unistim \
--disable chan_alsa \
--disable chan_mgcp \
--disable chan_sip \
--disable chan_skinny \
--enable codec_a_mu \
--enable codec_adpcm \
--enable codec_alaw \
--enable codec_codec2 \
--enable codec_dahdi \
--enable codec_g722 \
--enable codec_g726 \
--enable codec_gsm \
--enable codec_ilbc \
--enable codec_lpc10 \
--enable codec_resample \
--enable codec_speex \
--enable codec_ulaw \
--enable codec_opus \
--enable codec_silk \
--enable codec_siren7 \
--enable codec_siren14 \
--enable codec_g729a \
--enable format_g719 \
--enable format_g723 \
--enable format_g726 \
--enable format_g729 \
--enable format_gsm \
--enable format_h263 \
--enable format_h264 \
--enable format_ilbc \
--enable format_ogg_vorbis \
--enable format_pcm \
--enable format_siren14 \
--enable format_siren7 \
--enable format_sln \
--enable format_wav \
--enable format_wav_gsm \
--enable format_ogg_speex \
--enable format_vox \
--enable func_aes \
--enable func_base64 \
--enable func_blacklist \
--enable func_callcompletion \
--enable func_callerid \
--enable func_cdr \
--enable func_channel \
--enable func_config \
--enable func_curl \
--enable func_cut \
--enable func_db \
--enable func_devstate \
--enable func_dialgroup \
--enable func_dialplan \
--enable func_enum \
--enable func_env \
--enable func_extstate \
--enable func_global \
--enable func_groupcount \
--enable func_hangupcause \
--enable func_holdintercept \
--enable func_iconv \
--enable func_jitterbuffer \
--enable func_lock \
--enable func_logic \
--enable func_math \
--enable func_md5 \
--enable func_module \
--enable func_odbc \
--enable func_periodic_hook \
--enable func_pjsip_aor \
--enable func_pjsip_contact \
--enable func_pjsip_endpoint \
--enable func_presencestate \
--enable func_rand \
--enable func_realtime \
--enable func_sha1 \
--enable func_shell \
--enable func_sorcery \
--enable func_speex \
--enable func_sprintf \
--enable func_srv \
--enable func_strings \
--enable func_sysinfo \
--enable func_talkdetect \
--enable func_timeout \
--enable func_uri \
--enable func_version \
--enable func_vmcount \
--enable func_volume \
--enable func_evalexten \
--enable func_frame_drop \
--enable func_frame_trace \
--enable func_json \
--enable func_pitchshift \
--enable func_sayfiles \
--enable func_scramble \
--enable pbx_config \
--enable pbx_loopback \
--enable pbx_spool \
--enable pbx_ael \
--enable pbx_dundi \
--enable pbx_lua \
--enable pbx_realtime \
--enable res_aeap \
--enable res_agi \
--enable res_ari \
--enable res_ari_applications \
--enable res_ari_asterisk \
--enable res_ari_bridges \
--enable res_ari_channels \
--enable res_ari_device_states \
--enable res_ari_endpoints \
--enable res_ari_events \
--enable res_ari_mailboxes \
--enable res_ari_model \
--enable res_ari_playbacks \
--enable res_ari_recordings \
--enable res_ari_sounds \
--enable res_clialiases \
--enable res_clioriginate \
--enable res_config_curl \
--enable res_config_odbc \
--enable res_config_sqlite3 \
--enable res_convert \
--enable res_crypto \
--enable res_curl \
--enable res_fax \
--enable res_format_attr_celt \
--enable res_format_attr_g729 \
--enable res_format_attr_h263 \
--enable res_format_attr_h264 \
--enable res_format_attr_ilbc \
--enable res_format_attr_opus \
--enable res_format_attr_silk \
--enable res_format_attr_siren14 \
--enable res_format_attr_siren7 \
--enable res_format_attr_vp8 \
--enable res_geolocation \
--enable res_http_media_cache \
--enable res_http_post \
--enable res_http_websocket \
--enable res_limit \
--enable res_manager_devicestate \
--enable res_manager_presencestate \
--enable res_musiconhold \
--enable res_mutestream \
--enable res_mwi_devstate \
--disable res_mwi_external \
--enable res_mwi_external_ami \
--enable res_odbc \
--enable res_odbc_transaction \
--enable res_parking \
--enable res_pjproject \
--enable res_pjsip \
--enable res_pjsip_acl \
--enable res_pjsip_authenticator_digest \
--enable res_pjsip_caller_id \
--enable res_pjsip_config_wizard \
--enable res_pjsip_dialog_info_body_gen \
--enable res_pjsip_diversion \
--enable res_pjsip_dlg_options \
--enable res_pjsip_dtmf_info \
--enable res_pjsip_empty_info \
--enable res_pjsip_endpoint_identifier_ \
--enable res_pjsip_endpoint_identifier_ \
--enable res_pjsip_endpoint_identifier_ \
--enable res_pjsip_exten_state \
--enable res_pjsip_geolocation \
--enable res_pjsip_header_funcs \
--enable res_pjsip_logger \
--enable res_pjsip_messaging \
--enable res_pjsip_mwi \
--enable res_pjsip_mwi_body_generator \
--enable res_pjsip_nat \
--enable res_pjsip_notify \
--enable res_pjsip_one_touch_record_inf \
--enable res_pjsip_outbound_authenticat \
--enable res_pjsip_outbound_publish \
--enable res_pjsip_outbound_registratio \
--enable res_pjsip_path \
--enable res_pjsip_pidf_body_generator \
--enable res_pjsip_pidf_digium_body_sup \
--enable res_pjsip_pidf_eyebeam_body_su \
--enable res_pjsip_publish_asterisk \
--enable res_pjsip_pubsub \
--enable res_pjsip_refer \
--enable res_pjsip_registrar \
--enable res_pjsip_rfc3326 \
--enable res_pjsip_sdp_rtp \
--enable res_pjsip_send_to_voicemail \
--enable res_pjsip_session \
--enable res_pjsip_sips_contact \
--enable res_pjsip_stir_shaken \
--enable res_pjsip_t38 \
--enable res_pjsip_transport_websocket \
--enable res_pjsip_xpidf_body_generator \
--enable res_realtime \
--enable res_resolver_unbound \
--enable res_rtp_asterisk \
--enable res_rtp_multicast \
--enable res_security_log \
--enable res_sorcery_astdb \
--enable res_sorcery_config \
--enable res_sorcery_memory \
--enable res_sorcery_memory_cache \
--enable res_sorcery_realtime \
--enable res_speech \
--enable res_speech_aeap \
--enable res_srtp \
--enable res_stasis \
--enable res_stasis_answer \
--enable res_stasis_device_state \
--enable res_stasis_mailbox \
--enable res_stasis_playback \
--enable res_stasis_recording \
--enable res_stasis_snoop \
--enable res_stasis_test \
--enable res_stir_shaken \
--enable res_stun_monitor \
--enable res_timing_dahdi \
--enable res_timing_timerfd \
--enable res_xmpp \
--enable res_ael_share \
--enable res_audiosocket \
--enable res_calendar \
--enable res_calendar_caldav \
--enable res_calendar_ews \
--enable res_calendar_exchange \
--enable res_calendar_icalendar \
--enable res_chan_stats \
--disable res_cliexec \
--enable res_config_ldap \
--enable res_config_pgsql \
--enable res_corosync \
--enable res_endpoint_stats \
--enable res_fax_spandsp \
--enable res_hep \
--enable res_hep_pjsip \
--enable res_hep_rtcp \
--enable res_phoneprov \
--enable res_pjsip_history \
--enable res_pjsip_phoneprov_provider \
--enable res_prometheus \
--disable res_remb_modifier \
--enable res_smdi \
--enable res_snmp \
--enable res_statsd \
--enable res_timing_kqueue \
--enable res_timing_pthread \
--enable res_tonedetect \
--enable res_adsi \
--disable res_monitor \
--disable res_pktccops \
--enable res_digium_phone \
--enable astcanary \
--enable astdb2sqlite3 \
--enable astdb2bdb \
--disable check_expr \
--disable check_expr2 \
--disable smsq \
--disable stereorize \
--disable streamplayer \
--disable conf_bridge_binaural_hrir_impo \
--disable aelparse \
--disable astman \
--disable agi-test.agi \
--disable eagi-test \
--disable eagi-sphinx-test \
--disable jukebox.agi \
--enable CORE-SOUNDS-EN-WAV \
--enable CORE-SOUNDS-EN-ULAW \
--enable CORE-SOUNDS-EN-ALAW \
--enable CORE-SOUNDS-EN-GSM \
--disable CORE-SOUNDS-EN-G729 \
--disable CORE-SOUNDS-EN-G722 \
--disable CORE-SOUNDS-EN-SLN16 \
--disable CORE-SOUNDS-EN-SIREN7 \
--disable CORE-SOUNDS-EN-SIREN14 \
--disable CORE-SOUNDS-EN_AU-WAV \
--disable CORE-SOUNDS-EN_AU-ULAW \
--disable CORE-SOUNDS-EN_AU-ALAW \
--disable CORE-SOUNDS-EN_AU-GSM \
--disable CORE-SOUNDS-EN_AU-G729 \
--disable CORE-SOUNDS-EN_AU-G722 \
--disable CORE-SOUNDS-EN_AU-SLN16 \
--disable CORE-SOUNDS-EN_AU-SIREN7 \
--disable CORE-SOUNDS-EN_AU-SIREN14 \
--disable CORE-SOUNDS-EN_GB-WAV \
--disable CORE-SOUNDS-EN_GB-ULAW \
--disable CORE-SOUNDS-EN_GB-ALAW \
--disable CORE-SOUNDS-EN_GB-GSM \
--disable CORE-SOUNDS-EN_GB-G729 \
--disable CORE-SOUNDS-EN_GB-G722 \
--disable CORE-SOUNDS-EN_GB-SLN16 \
--disable CORE-SOUNDS-EN_GB-SIREN7 \
--disable CORE-SOUNDS-EN_GB-SIREN14 \
--disable CORE-SOUNDS-EN_NZ-WAV \
--disable CORE-SOUNDS-EN_NZ-ULAW \
--disable CORE-SOUNDS-EN_NZ-ALAW \
--disable CORE-SOUNDS-EN_NZ-GSM \
--disable CORE-SOUNDS-EN_NZ-G729 \
--disable CORE-SOUNDS-EN_NZ-G722 \
--disable CORE-SOUNDS-EN_NZ-SLN16 \
--disable CORE-SOUNDS-EN_NZ-SIREN7 \
--disable CORE-SOUNDS-EN_NZ-SIREN14 \
--disable CORE-SOUNDS-ES-WAV \
--disable CORE-SOUNDS-ES-ULAW \
--disable CORE-SOUNDS-ES-ALAW \
--disable CORE-SOUNDS-ES-GSM \
--disable CORE-SOUNDS-ES-G729 \
--disable CORE-SOUNDS-ES-G722 \
--disable CORE-SOUNDS-ES-SLN16 \
--disable CORE-SOUNDS-ES-SIREN7 \
--disable CORE-SOUNDS-ES-SIREN14 \
--disable CORE-SOUNDS-FR-WAV \
--disable CORE-SOUNDS-FR-ULAW \
--disable CORE-SOUNDS-FR-ALAW \
--disable CORE-SOUNDS-FR-GSM \
--disable CORE-SOUNDS-FR-G729 \
--disable CORE-SOUNDS-FR-G722 \
--disable CORE-SOUNDS-FR-SLN16 \
--disable CORE-SOUNDS-FR-SIREN7 \
--disable CORE-SOUNDS-FR-SIREN14 \
--disable CORE-SOUNDS-IT-WAV \
--disable CORE-SOUNDS-IT-ULAW \
--disable CORE-SOUNDS-IT-ALAW \
--disable CORE-SOUNDS-IT-GSM \
--disable CORE-SOUNDS-IT-G729 \
--disable CORE-SOUNDS-IT-G722 \
--disable CORE-SOUNDS-IT-SLN16 \
--disable CORE-SOUNDS-IT-SIREN7 \
--disable CORE-SOUNDS-IT-SIREN14 \
--enable CORE-SOUNDS-RU-WAV \
--enable CORE-SOUNDS-RU-ULAW \
--enable CORE-SOUNDS-RU-ALAW \
--enable CORE-SOUNDS-RU-GSM \
--disable CORE-SOUNDS-RU-G729 \
--disable CORE-SOUNDS-RU-G722 \
--disable CORE-SOUNDS-RU-SLN16 \
--disable CORE-SOUNDS-RU-SIREN7 \
--disable CORE-SOUNDS-RU-SIREN14 \
--disable CORE-SOUNDS-JA-WAV \
--disable CORE-SOUNDS-JA-ULAW \
--disable CORE-SOUNDS-JA-ALAW \
--disable CORE-SOUNDS-JA-GSM \
--disable CORE-SOUNDS-JA-G729 \
--disable CORE-SOUNDS-JA-G722 \
--disable CORE-SOUNDS-JA-SLN16 \
--disable CORE-SOUNDS-JA-SIREN7 \
--disable CORE-SOUNDS-JA-SIREN14 \
--disable CORE-SOUNDS-SV-WAV \
--disable CORE-SOUNDS-SV-ULAW \
--disable CORE-SOUNDS-SV-ALAW \
--disable CORE-SOUNDS-SV-GSM \
--disable CORE-SOUNDS-SV-G729 \
--disable CORE-SOUNDS-SV-G722 \
--disable CORE-SOUNDS-SV-SLN16 \
--disable CORE-SOUNDS-SV-SIREN7 \
--disable CORE-SOUNDS-SV-SIREN14 \
--enable MOH-OPSOUND-WAV \
--enable MOH-OPSOUND-ULAW \
--enable MOH-OPSOUND-ALAW \
--enable MOH-OPSOUND-GSM \
--disable MOH-OPSOUND-G729 \
--disable MOH-OPSOUND-G722 \
--disable MOH-OPSOUND-SLN16 \
--disable MOH-OPSOUND-SIREN7 \
--disable MOH-OPSOUND-SIREN14 \
--enable EXTRA-SOUNDS-EN-WAV \
--enable EXTRA-SOUNDS-EN-ULAW \
--enable EXTRA-SOUNDS-EN-ALAW \
--disable EXTRA-SOUNDS-EN-GSM \
--disable EXTRA-SOUNDS-EN-G729 \
--disable EXTRA-SOUNDS-EN-G722 \
--disable EXTRA-SOUNDS-EN-SLN16 \
--disable EXTRA-SOUNDS-EN-SIREN7 \
--disable EXTRA-SOUNDS-EN-SIREN14 \
--disable EXTRA-SOUNDS-EN_GB-WAV \
--disable EXTRA-SOUNDS-EN_GB-ULAW \
--disable EXTRA-SOUNDS-EN_GB-ALAW \
--disable EXTRA-SOUNDS-EN_GB-GSM \
--disable EXTRA-SOUNDS-EN_GB-G729 \
--disable EXTRA-SOUNDS-EN_GB-G722 \
--disable EXTRA-SOUNDS-EN_GB-SLN16 \
--disable EXTRA-SOUNDS-EN_GB-SIREN7 \
--disable EXTRA-SOUNDS-EN_GB-SIREN14 \
--disable EXTRA-SOUNDS-FR-WAV \
--disable EXTRA-SOUNDS-FR-ULAW \
--disable EXTRA-SOUNDS-FR-ALAW \
--disable EXTRA-SOUNDS-FR-GSM \
--disable EXTRA-SOUNDS-FR-G729 \
--disable EXTRA-SOUNDS-FR-G722 \
--disable EXTRA-SOUNDS-FR-SLN16 \
--disable EXTRA-SOUNDS-FR-SIREN7 \
--disable EXTRA-SOUNDS-FR-SIREN14 \
  menuselect.makeopts \
  && make -j$(nproc) 1> /dev/null \
  && make -j$(nproc) install 1> /dev/null
USER root
CMD /usr/sbin/asterisk -fvvvvv
