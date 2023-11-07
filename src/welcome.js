import React, { useState } from 'react';
import { View, StyleSheet, Text, ScrollView } from 'react-native';
import Background from './background';
import Field from './Field';
import Btn from './buton';
import { green, darkGreen } from './Constants';

const AppointmentScreen = () => {
  const [selectedDoctor, setSelectedDoctor] = useState('');
  const [selectedDate, setSelectedDate] = useState('');
  const [selectedTime, setSelectedTime] = useState('');

  const handleBooking = () => {
    // Xử lý khi người dùng nhấn nút "Đặt lịch"
    console.log('Đặt lịch bác sĩ');
    console.log('Tên bác sĩ:', selectedDoctor);
    console.log('Ngày:', selectedDate);
    console.log('Giờ:', selectedTime);
  };

  return (
    <Background>
      <ScrollView contentContainerStyle={styles.container}>
        <Text style={styles.title}>Đặt lịch bác sĩ</Text>
        <Field
          placeholder="Nhập tên bác sĩ"
          value={selectedDoctor}
          onChangeText={text => setSelectedDoctor(text)}
        />
        <Field
          placeholder="Chọn ngày"
          value={selectedDate}
          onChangeText={text => setSelectedDate(text)}
        />
        <Field
          placeholder="Chọn giờ"
          value={selectedTime}
          onChangeText={text => setSelectedTime(text)}
        />
        <Btn
          bgColor={green}
          btnLabel="Đặt lịch"
          textColor={darkGreen}
          Press={handleBooking}
        />
        <View style={styles.additionalInfoContainer}>
          <Text style={styles.additionalInfo}>Thông tin bổ sung:</Text>
          <Text style={styles.infoText}>
            - Đặt lịch trước ít nhất 24 giờ trước khi bạn muốn khám
          </Text>
          <Text style={styles.infoText}>
            - Hủy lịch trước 2 giờ để tránh phí hủy bỏ
          </Text>
          <Text style={styles.infoText}>
            - Liên hệ tổng đài 1800-1234 để được hỗ trợ
          </Text>
        </View>
      </ScrollView>
    </Background>
  );
};

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: darkGreen,
    marginBottom: 20,
  },
  additionalInfoContainer: {
    flex: 1,
    alignItems: 'center',
    marginTop: 20,
    marginBottom: 10,
  },
  additionalInfo: {
    fontSize: 18,
    fontWeight: 'bold',
    color: darkGreen,
    marginBottom: 10,
  },
  infoText: {
    fontSize: 16,
    color: darkGreen,
    marginBottom: 5,
  },
});

export default AppointmentScreen;