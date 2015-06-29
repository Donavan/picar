#ifndef _vector_h
#define _vector_h

#include <Eigen/Core>
#include <Eigen/Geometry>
#include "rice/Array.hpp"

typedef Eigen::Vector3f vector;
typedef Eigen::Vector3i int_vector;
typedef Eigen::Matrix3f matrix;
typedef Eigen::Quaternionf quaternion;

static inline Rice::Array array_from_vector(const vector& vec)
{
    Rice::Array vecArray;
    vecArray.push(vec[0]);
    vecArray.push(vec[1]);
    vecArray.push(vec[2]);
    return vecArray;
}

static inline Rice::Array array_from_ints(int (*ints)[3])
{
    Rice::Array vec_array;
    vec_array.push((float)(*ints)[0]);
    vec_array.push((float)(*ints)[1]);
    vec_array.push((float)(*ints)[2]);
    return vec_array;
}

static inline Rice::Array int_array_from_ints(int (*ints)[3])
{
    Rice::Array vec_array;
    vec_array.push((*ints)[0]);
    vec_array.push((*ints)[1]);
    vec_array.push((*ints)[2]);
    return vec_array;
}


static inline Rice::Array array_from_vector(const int_vector& vec)
{
    Rice::Array vec_array;
    vec_array.push(vec[0]);
    vec_array.push(vec[1]);
    vec_array.push(vec[2]);
    return vec_array;
}

static inline vector vector_from_ints(int (*ints)[3])
{
    return vector((float)(*ints)[0], (float)(*ints)[1], (float)(*ints)[2]);
}

static inline int_vector int_vector_from_ints(int (*ints)[3])
{
    return int_vector((*ints)[0], (*ints)[1], (*ints)[2]);
}

#endif
