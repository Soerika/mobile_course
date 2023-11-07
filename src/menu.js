import React, { useState } from 'react';
import { View, StyleSheet, Text, ScrollView, TextInput, TouchableOpacity, FlatList, Image, ImageBackground } from 'react-native';

const Menu = ({ navigation }) => {
//   const [selectedDoctor, setSelectedDoctor] = useState('');
//   const [selectedDate, setSelectedDate] = useState('');
//   const [selectedTime, setSelectedTime] = useState('');

//   const handleBooking = () => {
//     // Xử lý khi người dùng nhấn nút "Đặt lịch"
//     console.log('Đặt lịch bác sĩ');
//     console.log('Tên bác sĩ:', selectedDoctor);
//     console.log('Ngày:', selectedDate);
//     console.log('Giờ:', selectedTime);
//   };

  return (
    <View style={styles.container}>
      <ScrollView style={styles.container}>
        <View style={styles.container}>
          <Text style={styles.heading}>Select Category</Text>
          <View style={{ marginTop: 20 }}>
            <FlatList
              data={[1, 1, 1, 1, 1, 1, 1]}
              horizontal
              showsHorizontalScrollIndicator={false}
              renderItem={({ item, index }) => {
                return (
                  <TouchableOpacity>
                    <View style={styles.linearGradient}>
                      <Text style={styles.catName}>
                        {'Category ' + (index + 1)}
                      </Text>
                    </View>
                  </TouchableOpacity>
                );
              }}
            />
          </View>
          <Text style={styles.heading}>Top Rated Doctors</Text>
          <View style={{ marginTop: 20, alignItems: 'center' }}>
            <FlatList
              numColumns={2}
              data={[1, 1, 1, 1, 1, 1]}
              renderItem={({ item, index }) => {
                return (
                  <View style={styles.docItem}>
                    <Image
                      source={require('./images/doctor.png')}
                      style={styles.docImg}
                    />
                    <Text style={styles.docName}>Doctor {index + 1}</Text>
                    <Text style={styles.docSpl}>Skin Specialist</Text>
                    <Text
                      style={[
                        styles.status,
                        {
                          color: index / 2 == 0 ? 'green' : 'red',
                          opacity: index / 2 == 0 ? 1 : 0.5,
                        },
                      ]}
                    >
                      {index / 2 == 0 ? 'Available' : 'Busy'}
                    </Text>
                    <TouchableOpacity
                      style={[
                        styles.btn,
                        { opacity: index / 2 == 0 ? 1 : 0.5 },
                      ]}
                      disabled={index / 2 !== 0}
                      onPress={() => {
                        if (index / 2 == 0) {
                          navigation.navigate('BookAppointment');
                        }
                      }}
                    >
                      <Text style={styles.btnText}>
                        {index / 2 == 0 ? 'Book Appointment' : 'Not Available'}
                      </Text>
                    </TouchableOpacity>
                  </View>
                );
              }}
            />
          </View>
        </View>
      </ScrollView>
      <View style={styles.bottomView}>
        <TouchableOpacity
          onPress={() => {
            navigation.navigate('Completed');
          }}
        >
          <Image
            source={require('./images/completed.png')}
            style={styles.bottomIcon}
          />
        </TouchableOpacity>
        <TouchableOpacity
          onPress={() => {
            navigation.navigate('Pending');
          }}
        >
          <Image
            source={require('./images/pending.png')}
            style={styles.bottomIcon}
          />
        </TouchableOpacity>
        <TouchableOpacity
          onPress={() => {
            navigation.navigate('CallAmb');
          }}
        >
          <Image
            source={require('./images/ambulance.png')}
            style={styles.bottomIcon}
          />
        </TouchableOpacity>
      </View>
    </View>
  );
};

export default Menu;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  heading: {
    color: '#000',
    fontSize: 18,
    fontWeight: '700',
    marginTop: 15,
    marginLeft: 15,
  },
  linearGradient: {
    width: 120,
    height: 80,
    borderRadius: 10,
    marginLeft: 10,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#009FFD',
    marginBottom: 10
  },
  catName: {
    color: '#fff',
    fontSize: 16,
    fontWeight: '700',
  },
  docItem: {
    width: '45%',
    backgroundColor: '#fff',
    borderRadius: 10,
    borderWidth: 0.2,
    margin: 10,
    },
    docImg: {
    width: 100,
    height: 100,
    borderRadius: 50,
    alignSelf: 'center',
    marginTop: 10,
    },
    docName: {
    color: '#000',
    fontSize: 16,
    fontWeight: '700',
    alignSelf: 'center',
    marginTop: 10,
    },
    docSpl: {
    color: '#666',
    fontSize: 14,
    fontWeight: '500',
    alignSelf: 'center',
    marginTop: 5,
    },
    status: {
    fontSize: 14,
    alignSelf: 'center',
    marginTop: 5,
    },
    btn: {
    backgroundColor: '#009FFD',
    borderRadius: 5,
    marginHorizontal: 10,
    marginTop: 10,
    marginBottom: 15,
    paddingHorizontal: 10,
    paddingVertical: 6,
    },
    btnText: {
    color: '#fff',
    fontSize: 14,
    fontWeight: '700',
    textAlign: 'center',
    },
    bottomView: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
    paddingVertical: 10,
    backgroundColor: '#F5F5F5',
    },
    bottomIcon: {
    width: 24,
    height: 24,
    },
});